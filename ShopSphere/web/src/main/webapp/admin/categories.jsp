<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Categories</title>

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

        /* PAGE HEADER */
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

        /* FORM */
        .form-box {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 26px;
            margin-bottom: 30px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
        }

        .card-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .card-title h2 {
            font-size: 21px;
        }

        .card-title span {
            color: #6b7280;
            font-size: 13px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            color: #374151;
            margin-bottom: 7px;
        }

        input,
        textarea {
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
        textarea:focus {
            border-color: #6b7280;
            box-shadow: 0 0 0 3px rgba(107,114,128,0.10);
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        .btn-primary {
            display: inline-block;
            border: none;
            border-radius: 10px;
            padding: 12px 20px;
            background: #111827;
            color: white;
            cursor: pointer;
            font-size: 13px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        .btn-primary:hover {
            background: #374151;
            transform: translateY(-1px);
        }

        /* CATEGORY HEADER */
        .list-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .list-header h2 {
            font-size: 22px;
        }

        .list-header span {
            color: #6b7280;
            font-size: 13px;
        }

        /* CATEGORY GRID */
        .category-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .category-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 23px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.08);
        }

        .category-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 18px;
        }

        .category-icon {
            width: 50px;
            height: 50px;
            border-radius: 14px;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .status-badge {
            padding: 6px 9px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-size: 11px;
            font-weight: bold;
        }

        .category-card h3 {
            font-size: 20px;
            margin-bottom: 9px;
        }

        .category-card p {
            color: #6b7280;
            font-size: 13px;
            line-height: 1.6;
            min-height: 48px;
        }

        .category-footer {
            border-top: 1px solid #f0f0f0;
            margin-top: 20px;
            padding-top: 14px;
            color: #9ca3af;
            font-size: 12px;
        }

        /* EMPTY */
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
        @media (max-width: 1050px) {
            .category-grid {
                grid-template-columns: repeat(2, 1fr);
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

            .content {
                padding: 20px;
            }

            .category-grid {
                grid-template-columns: 1fr;
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

        <a class="nav-link"
           href="${pageContext.request.contextPath}/admin/products">
            <span class="nav-icon">📦</span>
            Products
        </a>

        <a class="nav-link active"
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
                <h2>Category Management</h2>
                <p>Organize and manage your ShopSphere product categories.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-header">

                <h1>Category Management 🗂️</h1>

                <p>
                    Create and maintain product categories to keep the
                    ShopSphere catalog organized.
                </p>

            </div>


            <!-- ALERTS -->

            <c:if test="${param.success == '1'}">

                <div class="alert success">
                    ✅ Category added successfully!
                </div>

            </c:if>


            <c:if test="${param.error == '1'}">

                <div class="alert error">
                    ❌ Category could not be added.
                </div>

            </c:if>


            <!-- ADD CATEGORY -->

            <div class="form-box">

                <div class="card-title">

                    <div>
                        <h2>➕ Add New Category</h2>
                    </div>

                    <span>Create a category for your catalog</span>

                </div>


                <form action="${pageContext.request.contextPath}/admin/categories"
                      method="post">

                    <div class="form-group">

                        <label>Category Name</label>

                        <input type="text"
                               name="name"
                               placeholder="Enter category name"
                               required>

                    </div>


                    <div class="form-group">

                        <label>Description</label>

                        <textarea
                            name="description"
                            placeholder="Enter category description"
                            required></textarea>

                    </div>


                    <button type="submit"
                            class="btn-primary">
                        + Add Category
                    </button>

                </form>

            </div>


            <!-- CATEGORY LIST -->

            <div class="list-header">

                <h2>Existing Categories</h2>

                <span>ShopSphere Catalog Organization</span>

            </div>


            <c:if test="${empty categories}">

                <div class="empty-state">

                    <div class="icon">🗂️</div>

                    <h3>No Categories Found</h3>

                    <p>
                        Add your first category using the form above.
                    </p>

                </div>

            </c:if>


            <c:if test="${not empty categories}">

                <div class="category-grid">

                    <c:forEach var="category" items="${categories}">

                        <div class="category-card">

                            <div class="category-top">

                                <div class="category-icon">
                                    🗂️
                                </div>

                                <div class="status-badge">
                                    ACTIVE
                                </div>

                            </div>


                            <h3>
                                ${category.name}
                            </h3>


                            <p>
                                ${category.description}
                            </p>


                            <div class="category-footer">

                                <strong>Status:</strong>
                                ${category.status}

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>


            <div class="footer-note">
                ShopSphere Admin Panel • Category Management
            </div>

        </section>

    </main>

</div>

</body>
</html>