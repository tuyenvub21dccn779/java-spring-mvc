<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <c:set var="req" value="${pageContext.request}" />
            <c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Update Product</title>
                <link href="/css/styles.css" rel="stylesheet" />

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#productImageFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#productPreview").attr("src", imgURL);
                            $("#productPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>

                                </ol>
                                <div class=" my-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a product with id ${product.id}</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/product/update"
                                                modelAttribute="product" enctype="multipart/form-data" class="row">

                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text" class="form-control" path="name" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="number" class="form-control" path="price" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <label class="form-label">Detail description:</label>
                                                    <form:textarea class="form-control" path="detailDesc" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Short description:</label>
                                                    <form:input type="text" class="form-control" path="shortDesc" />
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number" class="form-control" path="quantity" />
                                                </div>

                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select path="factory" class="form-select">
                                                        <form:option value="apple">Apple (MacBook)</form:option>
                                                        <form:option value="asus">Asus</form:option>
                                                        <form:option value="lenovo">Lenovo</form:option>
                                                        <form:option value="dell">Dell</form:option>
                                                        <form:option value="lg">LG</form:option>
                                                        <form:option value="acer">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Target:</label>
                                                    <form:select path="target" class="form-select">
                                                        <form:option value="gaming">Gaming</form:option>
                                                        <form:option value="sinh vien">Sinh Viên - Văn phòng
                                                        </form:option>
                                                        <form:option value="thiet ke do hoa">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="mong nhe">Mỏng nhẹ</form:option>
                                                        <form:option value="doanh nhan">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="col-md-6  mb-3">
                                                    <label for="productImageFile" class="form-label">Avatar:</label>
                                                    <input type="file" class="form-control" id="productImageFile"
                                                        accept=".png, .jpg, .jpeg" name="productImageFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <c:choose>
                                                        <c:when test="${product.image == null}">
                                                            <img style="max-height: 250px; display: none;"
                                                                alt="product preview" id="productPreview" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img style="max-height: 250px;" alt="product preview"
                                                                id="productPreview"
                                                                src="${baseURL}/images/product/${product.image}" />
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                                <div class="col-12">
                                                    <a href="/admin/product" class="btn btn-success">Back</a>
                                                    <button type="submit" class="btn btn-warning mx-2">Update</button>
                                                </div>
                                            </form:form>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

            </body>

            </html>