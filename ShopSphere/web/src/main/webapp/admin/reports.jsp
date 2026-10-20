<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Reports</title>

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

        /* SUMMARY */
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 21px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .summary-icon {
            width: 52px;
            height: 52px;
            border-radius: 15px;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            flex-shrink: 0;
        }

        .summary-card h3 {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 6px;
        }

        .card-value {
            font-size: 27px;
            font-weight: bold;
            color: #111827;
        }

        /* REPORT SECTION */
        .section {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .section-header h2 {
            font-size: 21px;
        }

        .section-header span {
            color: #6b7280;
            font-size: 13px;
        }

        /* TABLE */
        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th {
            background: #f9fafb;
            color: #6b7280;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            text-align: left;
            padding: 13px 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        td {
            padding: 15px 14px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 13px;
            color: #374151;
        }

        tbody tr {
            transition: 0.15s ease;
        }

        tbody tr:hover {
            background: #fafafa;
        }

        .product-name {
            font-weight: bold;
            color: #111827;
        }

        .product-id {
            color: #9ca3af;
            font-size: 11px;
        }

        .stock-badge {
            display: inline-block;
            padding: 6px 9px;
            border-radius: 8px;
            background: #fff7ed;
            color: #c2410c;
            font-weight: bold;
            font-size: 11px;
        }

        .price {
            font-weight: bold;
        }

        /* EMPTY */
        .empty-state {
            background: #f9fafb;
            border: 1px dashed #d1d5db;
            border-radius: 14px;
            padding: 42px 20px;
            text-align: center;
            color: #6b7280;
        }

        .empty-icon {
            font-size: 45px;
            margin-bottom: 12px;
        }

        .empty-state strong {
            display: block;
            color: #047857;
            margin-bottom: 6px;
        }

        /* INFO */
        .info-box {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 16px;
            color: #6b7280;
            font-size: 13px;
            line-height: 1.6;
        }

        .footer-note {
            text-align: center;
            color: #9ca3af;
            font-size: 12px;
            padding: 35px 0 15px;
        }

        /* RESPONSIVE */
        @media (max-width: 1000px) {
            .summary-grid {
                grid-template-columns: 1fr;
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

        <a class="nav-link active"
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
                <h2>Reports & Analytics</h2>
                <p>Monitor ShopSphere sales and inventory health.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- PAGE HEADER -->

            <div class="page-header">

                <h1>Reports & Analytics 📊</h1>

                <p>
                    Review paid orders, total sales and low-stock products
                    from the ShopSphere administration panel.
                </p>

            </div>


            <!-- SUMMARY CARDS -->

            <div class="summary-grid">

                <div class="summary-card">

                    <div class="summary-icon">
                        ✅
                    </div>

                    <div>
                        <h3>Paid Orders</h3>

                        <div class="card-value">
                            ${paidOrders}
                        </div>
                    </div>

                </div>


                <div class="summary-card">

                    <div class="summary-icon">
                        💰
                    </div>

                    <div>
                        <h3>Total Sales</h3>

                        <div class="card-value">
                            ₹${totalSales}
                        </div>
                    </div>

                </div>


                <div class="summary-card">

                    <div class="summary-icon">
                        ⚠️
                    </div>

                    <div>
                        <h3>Low Stock Products</h3>

                        <div class="card-value">
                            ${lowStockProducts.size()}
                        </div>
                    </div>

                </div>

            </div>


            <!-- LOW STOCK SECTION -->

            <div class="section">

                <div class="section-header">

                    <h2>Low Stock Products</h2>

                    <span>Inventory Watch</span>

                </div>


                <c:choose>

                    <c:when test="${empty lowStockProducts}">

                        <div class="empty-state">

                            <div class="empty-icon">
                                ✅
                            </div>

                            <strong>
                                Inventory looks healthy
                            </strong>

                            No low-stock products found.

                        </div>

                    </c:when>


                    <c:otherwise>

                        <div class="table-wrapper">

                            <table>

                                <thead>

                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Current Stock</th>
                                    </tr>

                                </thead>


                                <tbody>

                                <c:forEach
                                    var="product"
                                    items="${lowStockProducts}">

                                    <tr>

                                        <td>
                                            <span class="product-id">
                                                #${product.productId}
                                            </span>
                                        </td>

                                        <td>
                                            <span class="product-name">
                                                ${product.name}
                                            </span>
                                        </td>

                                        <td class="price">
                                            ₹${product.price}
                                        </td>

                                        <td>
                                            <span class="stock-badge">
                                                ${product.stock} left
                                            </span>
                                        </td>

                                    </tr>

                                </c:forEach>

                                </tbody>

                            </table>

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>


            <!-- REPORT INFO -->

            <div class="section">

                <div class="section-header">

                    <h2>Store Overview</h2>

                    <span>Admin Insights</span>

                </div>

                <div class="info-box">

                    ShopSphere reports provide a quick overview of paid
                    orders, sales performance and inventory items that
                    require attention.

                </div>

            </div>


            <div class="footer-note">
                ShopSphere Admin Panel • Reports & Analytics
            </div>

        </section>

    </main>

</div>

</body>
</html>