<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Products</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            color: #1f2937;
        }

        a {
            text-decoration: none;
        }

        /* LAYOUT */
        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* SIDEBAR */
        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, #111827 0%, #1f2937 100%);
            color: white;
            padding: 24px 16px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            overflow-y: auto;
        }

        .brand {
            padding: 10px 14px 28px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 22px;
        }

        .brand h1 {
            font-size: 25px;
            margin-bottom: 7px;
        }

        .brand span {
            color: #9ca3af;
            font-size: 13px;
        }

        .section-title {
            color: #9ca3af;
            font-size: 11px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0 14px;
            margin-bottom: 10px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 13px;
            color: #d1d5db;
            padding: 13px 14px;
            margin: 5px 0;
            border-radius: 11px;
            font-size: 14px;
            transition: 0.2s ease;
        }

        .nav-link:hover,
        .nav-link.active {
            background: rgba(255,255,255,0.10);
            color: white;
        }

        .nav-icon {
            width: 25px;
            text-align: center;
            font-size: 18px;
        }

        .logout {
            margin-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 20px;
        }

        .logout a {
            color: #fca5a5;
        }

        /* MAIN */
        .main {
            margin-left: 250px;
            width: calc(100% - 250px);
            min-height: 100vh;
        }

        .topbar {
            background: white;
            border-bottom: 1px solid #e5e7eb;
            padding: 18px 32px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 5;
        }

        .topbar h2 {
            font-size: 21px;
            margin-bottom: 4px;
        }

        .topbar p {
            color: #6b7280;
            font-size: 13px;
        }

        .admin-badge {
            background: #f3f4f6;
            border: 1px solid #e5e7eb;
            padding: 9px 14px;
            border-radius: 25px;
            font-size: 13px;
            font-weight: bold;
        }

        .content {
            padding: 32px;
        }

        /* HEADER */
        .page-header {
            background: linear-gradient(135deg, #111827, #374151);
            color: white;
            border-radius: 20px;
            padding: 28px 30px;
            margin-bottom: 25px;
            box-shadow: 0 12px 30px rgba(17,24,39,0.14);
        }

        .page-header h1 {
            font-size: 29px;
            margin-bottom: 8px;
        }

        .page-header p {
            color: #d1d5db;
            font-size: 14px;
            line-height: 1.6;
        }

        /* ALERTS */
        .alert {
            padding: 14px 18px;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .success {
            background: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .error {
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        /* FORM CARD */
        .form-box,
        .edit-box {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 26px;
            margin-bottom: 28px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
        }

        .edit-box {
            border-left: 5px solid #111827;
        }

        .card-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 22px;
        }

        .card-title h2 {
            font-size: 21px;
        }

        .card-title span {
            color: #6b7280;
            font-size: 13px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 7px;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            background: white;
            color: #111827;
            font-size: 14px;
            outline: none;
            transition: 0.2s ease;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #6b7280;
            box-shadow: 0 0 0 3px rgba(107,114,128,0.10);
        }

        textarea {
            height: 105px;
            resize: vertical;
        }

        .button-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 5px;
            flex-wrap: wrap;
        }

        button,
        .btn {
            border: none;
            border-radius: 10px;
            padding: 11px 18px;
            cursor: pointer;
            font-size: 13px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        .btn-primary {
            background: #111827;
            color: white;
        }

        .btn-primary:hover {
            background: #374151;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: #f3f4f6;
            color: #374151;
            border: 1px solid #d1d5db;
        }

        .btn-secondary:hover {
            background: #e5e7eb;
        }

        /* PRODUCT SECTION */
        .list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0 18px;
        }

        .list-header h2 {
            font-size: 22px;
        }

        .list-header span {
            color: #6b7280;
            font-size: 13px;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .product-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 20px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.08);
        }

        .product-image {
            height: 150px;
            border-radius: 14px;
            background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 52px;
            margin-bottom: 17px;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-head {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            align-items: flex-start;
        }

        .product-head h3 {
            font-size: 18px;
            line-height: 1.3;
            margin-bottom: 5px;
        }

        .brand {
            color: #6b7280;
            font-size: 13px;
        }

        .status-badge {
            padding: 6px 9px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
            white-space: nowrap;
        }

        .status-active {
            background: #ecfdf5;
            color: #047857;
        }

        .status-inactive {
            background: #fef2f2;
            color: #b91c1c;
        }

        .description {
            margin: 14px 0;
            color: #6b7280;
            font-size: 13px;
            line-height: 1.55;
            min-height: 40px;
        }

        .price-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 14px 0;
        }

        .price {
            font-size: 21px;
            font-weight: bold;
            color: #111827;
        }

        .discount {
            background: #fff7ed;
            color: #c2410c;
            border: 1px solid #fed7aa;
            padding: 6px 8px;
            border-radius: 8px;
            font-size: 11px;
            font-weight: bold;
        }

        .meta-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 9px;
            margin: 14px 0;
        }

        .meta-box {
            background: #f9fafb;
            border: 1px solid #f0f0f0;
            padding: 10px;
            border-radius: 9px;
        }

        .meta-box small {
            display: block;
            color: #9ca3af;
            font-size: 11px;
            margin-bottom: 4px;
        }

        .meta-box strong {
            font-size: 13px;
        }

        .actions {
            display: flex;
            gap: 8px;
            margin-top: 15px;
        }

        .edit-button {
            flex: 1;
            text-align: center;
            background: #111827;
            color: white;
            padding: 10px;
            border-radius: 9px;
            font-size: 12px;
            font-weight: bold;
        }

        .edit-button:hover {
            background: #374151;
        }

        .delete-button {
            flex: 1;
            text-align: center;
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 10px;
            border-radius: 9px;
            font-size: 12px;
            font-weight: bold;
        }

        .delete-button:hover {
            background: #fee2e2;
        }

        .empty-state {
            background: white;
            border: 1px dashed #d1d5db;
            border-radius: 16px;
            padding: 45px 20px;
            text-align: center;
            color: #6b7280;
        }

        .empty-state .icon {
            font-size: 45px;
            margin-bottom: 12px;
        }

        .footer-note {
            text-align: center;
            color: #9ca3af;
            font-size: 12px;
            padding: 35px 0 15px;
        }

        /* RESPONSIVE */
        @media (max-width: 1150px) {
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 950px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: auto;
            }
        }

        @media (max-width: 800px) {
            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
                width: calc(100% - 210px);
            }

            .products-grid {
                grid-template-columns: 1fr;
            }

            .content {
                padding: 20px;
            }
        }

        @media (max-width: 650px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
            }

            .main {
                margin-left: 0;
                width: 100%;
            }

            .topbar {
                position: relative;
            }

            .topbar {
                padding: 16px 20px;
            }

            .admin-badge {
                display: none;
            }
        }
    </style>
</head>

<body>

<div class="layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">

        <div class="brand">
            <h1>ShopSphere</h1>
            <span>Admin Control Center</span>
        </div>

        <div class="section-title">Main Menu</div>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/dashboard.jsp">
            <span class="nav-icon">🏠</span>
            Dashboard
        </a>

        <a class="nav-link active"
           href="${pageContext.request.contextPath}/admin/products">
            <span class="nav-icon">📦</span>
            Products
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/categories">
            <span class="nav-icon">🗂️</span>
            Categories
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/orders">
            <span class="nav-icon">🛒</span>
            Orders
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/users">
            <span class="nav-icon">👥</span>
            Customers
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/coupons">
            <span class="nav-icon">🎟️</span>
            Coupons
        </a>

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/reports">
            <span class="nav-icon">📊</span>
            Reports
        </a>

        <div class="logout">
            <a class="nav-link"
               href="${pageContext.request.contextPath}/logout">
                <span class="nav-icon">🚪</span>
                Logout
            </a>
        </div>

    </aside>


    <!-- MAIN -->
    <main class="main">

        <header class="topbar">
            <div>
                <h2>Product Management</h2>
                <p>Manage your ShopSphere product inventory.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>
        </header>


        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-header">
                <h1>Product Management 📦</h1>
                <p>
                    Add new products, update existing products, monitor stock
                    and manage your online store catalog.
                </p>
            </div>


            <!-- ALERTS -->

            <c:if test="${param.success == '1'}">
                <div class="alert success">
                    ✅ Product added successfully!
                </div>
            </c:if>

            <c:if test="${param.updated == '1'}">
                <div class="alert success">
                    ✅ Product updated successfully!
                </div>
            </c:if>

            <c:if test="${param.deleted == '1'}">
                <div class="alert success">
                    ✅ Product deleted successfully!
                </div>
            </c:if>

            <c:if test="${param.error == '1'}">
                <div class="alert error">
                    ❌ Operation failed.
                </div>
            </c:if>


            <!-- EDIT PRODUCT -->

            <c:if test="${not empty editProduct}">

                <div class="edit-box">

                    <div class="card-title">
                        <div>
                            <h2>✏️ Edit Product</h2>
                        </div>

                        <span>Update existing product details</span>
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/products"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="update">

                        <input type="hidden"
                               name="productId"
                               value="${editProduct.productId}">

                        <div class="form-grid">

                            <div class="form-group">

                                <label>Category</label>

                                <select name="categoryId" required>

                                    <option value="1"
                                        <c:if test="${editProduct.categoryId == 1}">
                                            selected
                                        </c:if>>
                                        Electronics
                                    </option>

                                    <option value="2"
                                        <c:if test="${editProduct.categoryId == 2}">
                                            selected
                                        </c:if>>
                                        Fashion
                                    </option>

                                    <option value="3"
                                        <c:if test="${editProduct.categoryId == 3}">
                                            selected
                                        </c:if>>
                                        Home & Kitchen
                                    </option>

                                    <option value="4"
                                        <c:if test="${editProduct.categoryId == 4}">
                                            selected
                                        </c:if>>
                                        Books
                                    </option>

                                    <option value="5"
                                        <c:if test="${editProduct.categoryId == 5}">
                                            selected
                                        </c:if>>
                                        Sports
                                    </option>

                                </select>

                            </div>


                            <div class="form-group">

                                <label>Product Name</label>

                                <input type="text"
                                       name="name"
                                       value="${editProduct.name}"
                                       required>

                            </div>


                            <div class="form-group">

                                <label>Brand</label>

                                <input type="text"
                                       name="brand"
                                       value="${editProduct.brand}"
                                       required>

                            </div>


                            <div class="form-group">

                                <label>Price</label>

                                <input type="number"
                                       name="price"
                                       value="${editProduct.price}"
                                       step="0.01"
                                       min="0"
                                       required>

                            </div>


                            <div class="form-group">

                                <label>Discount (%)</label>

                                <input type="number"
                                       name="discount"
                                       value="${editProduct.discount}"
                                       step="0.01"
                                       min="0"
                                       required>

                            </div>


                            <div class="form-group">

                                <label>Stock</label>

                                <input type="number"
                                       name="stock"
                                       value="${editProduct.stock}"
                                       min="0"
                                       required>

                            </div>


                            <div class="form-group full">

                                <label>Description</label>

                                <textarea name="description"
                                          required>${editProduct.description}</textarea>

                            </div>


                            <div class="form-group full">

                                <label>Image URL</label>

                                <input type="text"
                                       name="imageUrl"
                                       value="${editProduct.imageUrl}"
                                       placeholder="images/product.jpg">

                            </div>

                        </div>


                        <div class="button-row">

                            <button type="submit"
                                    class="btn btn-primary">
                                Update Product
                            </button>

                            <a href="${pageContext.request.contextPath}/admin/products"
                               class="btn btn-secondary">
                                Cancel
                            </a>

                        </div>

                    </form>

                </div>

            </c:if>


            <!-- ADD PRODUCT -->

            <div class="form-box">

                <div class="card-title">

                    <div>
                        <h2>➕ Add New Product</h2>
                    </div>

                    <span>Create a product for your store</span>

                </div>


                <form action="${pageContext.request.contextPath}/admin/products"
                      method="post">

                    <div class="form-grid">

                        <div class="form-group">

                            <label>Category</label>

                            <select name="categoryId" required>

                                <option value="">
                                    Select Category
                                </option>

                                <option value="1">
                                    Electronics
                                </option>

                                <option value="2">
                                    Fashion
                                </option>

                                <option value="3">
                                    Home & Kitchen
                                </option>

                                <option value="4">
                                    Books
                                </option>

                                <option value="5">
                                    Sports
                                </option>

                            </select>

                        </div>


                        <div class="form-group">

                            <label>Product Name</label>

                            <input type="text"
                                   name="name"
                                   placeholder="Enter product name"
                                   required>

                        </div>


                        <div class="form-group">

                            <label>Brand</label>

                            <input type="text"
                                   name="brand"
                                   placeholder="Enter brand name"
                                   required>

                        </div>


                        <div class="form-group">

                            <label>Price</label>

                            <input type="number"
                                   name="price"
                                   placeholder="0.00"
                                   step="0.01"
                                   min="0"
                                   required>

                        </div>


                        <div class="form-group">

                            <label>Discount (%)</label>

                            <input type="number"
                                   name="discount"
                                   placeholder="0"
                                   step="0.01"
                                   min="0"
                                   value="0"
                                   required>

                        </div>


                        <div class="form-group">

                            <label>Stock</label>

                            <input type="number"
                                   name="stock"
                                   placeholder="Enter stock quantity"
                                   min="0"
                                   required>

                        </div>


                        <div class="form-group full">

                            <label>Description</label>

                            <textarea name="description"
                                      placeholder="Enter product description"
                                      required></textarea>

                        </div>


                        <div class="form-group full">

                            <label>Image URL</label>

                            <input type="text"
                                   name="imageUrl"
                                   placeholder="images/product.jpg">

                        </div>

                    </div>


                    <div class="button-row">

                        <button type="submit"
                                class="btn btn-primary">
                            + Add Product
                        </button>

                    </div>

                </form>

            </div>


            <!-- PRODUCT LIST -->

            <div class="list-header">

                <div>
                    <h2>Existing Products</h2>
                </div>

                <span>ShopSphere Catalog</span>

            </div>


            <c:if test="${empty products}">

                <div class="empty-state">

                    <div class="icon">📦</div>

                    <h3>No Products Found</h3>

                    <p>Add your first product using the form above.</p>

                </div>

            </c:if>


            <c:if test="${not empty products}">

                <div class="products-grid">

                    <c:forEach var="product" items="${products}">

                        <div class="product-card">

                            <!-- IMAGE / PLACEHOLDER -->

                            <div class="product-image">

                                <c:choose>

                                    <c:when test="${not empty product.imageUrl}">

                                        <img src="${product.imageUrl}"
                                             alt="${product.name}"
                                             onerror="this.style.display='none'; this.parentElement.innerHTML='📦';">

                                    </c:when>

                                    <c:otherwise>
                                        📦
                                    </c:otherwise>

                                </c:choose>

                            </div>


                            <!-- PRODUCT HEADER -->

                            <div class="product-head">

                                <div>

                                    <h3>${product.name}</h3>

                                    <div class="brand">
                                        ${product.brand}
                                    </div>

                                </div>


                                <c:choose>

                                    <c:when test="${product.status}">
                                        <span class="status-badge status-active">
                                            ACTIVE
                                        </span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="status-badge status-inactive">
                                            INACTIVE
                                        </span>
                                    </c:otherwise>

                                </c:choose>

                            </div>


                            <!-- DESCRIPTION -->

                            <div class="description">

                                ${product.description}

                            </div>


                            <!-- PRICE -->

                            <div class="price-row">

                                <div class="price">
                                    ₹${product.price}
                                </div>

                                <div class="discount">
                                    ${product.discount}% OFF
                                </div>

                            </div>


                            <!-- META -->

                            <div class="meta-grid">

                                <div class="meta-box">

                                    <small>Product ID</small>

                                    <strong>
                                        #${product.productId}
                                    </strong>

                                </div>


                                <div class="meta-box">

                                    <small>Category ID</small>

                                    <strong>
                                        ${product.categoryId}
                                    </strong>

                                </div>


                                <div class="meta-box">

                                    <small>Stock</small>

                                    <strong>
                                        ${product.stock}
                                    </strong>

                                </div>


                                <div class="meta-box">

                                    <small>Status</small>

                                    <strong>
                                        ${product.status}
                                    </strong>

                                </div>

                            </div>


                            <!-- ACTIONS -->

                            <div class="actions">

                                <a class="edit-button"
                                   href="${pageContext.request.contextPath}/admin/products?action=edit&id=${product.productId}">
                                    ✏️ Edit
                                </a>


                                <a class="delete-button"
                                   href="${pageContext.request.contextPath}/admin/products?action=delete&id=${product.productId}"
                                   onclick="return confirm('Are you sure you want to delete this product?');">
                                    🗑️ Delete
                                </a>

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>


            <div class="footer-note">
                ShopSphere Admin Panel • Product Management
            </div>

        </section>

    </main>

</div>

</body>
</html>