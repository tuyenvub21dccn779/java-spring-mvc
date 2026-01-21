package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("productList", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(
            Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductPage(
            Model model,
            @ModelAttribute("newProduct") Product product,
            @RequestParam("productImageFile") MultipartFile file) {

        String productImage = this.uploadService.handleSaveUploadFile(file, "product");

        product.setImage(productImage);

        productService.handleSaveProduct(product);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable("id") long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("id", id);
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(
            Model model,
            @ModelAttribute("product") Product product,
            @RequestParam("productImageFile") MultipartFile file) {
        Product currentProduct = this.productService.getProductById(product.getId());

        if (currentProduct != null) {
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setFactory(product.getFactory());
            currentProduct.setTarget(product.getTarget());
            if (file != null) {
                String productImage = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(productImage);
            }
            productService.handleSaveProduct(currentProduct);
        }

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable("id") long id) {
        Product product = new Product();
        product.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("deleteProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteUser(Model model, @ModelAttribute("deleteProduct") Product product) {
        this.productService.deleteAProduct(product.getId());
        return "redirect:/admin/product";
    }
}
