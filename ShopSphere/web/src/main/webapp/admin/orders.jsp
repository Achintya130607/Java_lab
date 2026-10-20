<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Orders</title>

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

        /* SUMMARY */
        .summary-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 18px 20px;
            margin-bottom: 24px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .summary-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }

        .summary-card h3 {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 4px;
        }

        .summary-card strong {
            font-size: 23px;
        }

        /* ORDERS */
        .orders-section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .orders-section-header h2 {
            font-size: 22px;
        }

        .orders-section-header span {
            color: #6b7280;
            font-size: 13px;
        }

        .orders-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .order-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 23px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
        }

        .order-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.08);
        }

        .order-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 20px;
        }

        .order-id {
            font-size: 20px;
            font-weight: bold;
            color: #111827;
        }

        .order-date {
            margin-top: 5px;
            color: #9ca3af;
            font-size: 12px;
        }

        .status-badge {
            padding: 7px 11px;
            border-radius: 20px;
            background: #eff6ff;
            color: #1d4ed8;
            font-size: 11px;
            font-weight: bold;
            white-space: nowrap;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .info-box {
            background: #f9fafb;
            border: 1px solid #f0f0f0;
            border-radius: 10px;
            padding: 12px;
        }

        .info-box small {
            display: block;
            color: #9ca3af;
            font-size: 11px;
            margin-bottom: 5px;
        }

        .info-box strong {
            display: block;
            color: #374151;
            font-size: 13px;
            word-break: break-word;
        }

        .amount-box {
            margin-top: 16px;
            padding: 15px;
            border-radius: 12px;
            background: #111827;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .amount-box span {
            color: #d1d5db;
            font-size: 12px;
        }

        .amount-box strong {
            font-size: 20px;
        }

        /* UPDATE STATUS */
        .update-section {
            margin-top: 18px;
            border-top: 1px solid #f0f0f0;
            padding-top: 18px;
        }

        .update-title {
            font-size: 12px;
            color: #6b7280;
            font-weight: bold;
            margin-bottom: 9px;
        }

        .status-form {
            display: flex;
            gap: 9px;
            align-items: center;
        }

        .status-form select {
            flex: 1;
            padding: 10px 11px;
            border: 1px solid #d1d5db;
            border-radius: 9px;
            background: white;
            color: #374151;
            font-size: 12px;
            outline: none;
        }

        .status-form select:focus {
            border-color: #374151;
            box-shadow: 0 0 0 3px rgba(55,65,81,0.08);
        }

        .update-btn {
            border: none;
            border-radius: 9px;
            padding: 10px 13px;
            background: #111827;
            color: white;
            cursor: pointer;
            font-size: 12px;
            font-weight: bold;
            white-space: nowrap;
        }

        .update-btn:hover {
            background: #374151;
        }

        .status-row {
            margin-top: 16px;
            border-top: 1px solid #f0f0f0;
            padding-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .status-label {
            font-size: 12px;
            color: #6b7280;
        }

        .payment-status {
            padding: 6px 9px;
            border-radius: 8px;
            background: #ecfdf5;
            color: #047857;
            font-size: 11px;
            font-weight: bold;
        }

        /* EMPTY */
        .empty-state {
            background: white;
            border: 1px dashed #d1d5db;
            border-radius: 16px;
            padding: 50px 20px;
            text-align: center;
            color: #6b7280;
        }

        .empty-state .icon {
            font-size: 50px;
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
            .orders-grid {
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

            .info-grid {
                grid-template-columns: 1fr;
            }

            .order-top {
                flex-direction: column;
            }

            .status-form {
                flex-direction: column;
                align-items: stretch;
            }

            .update-btn {
                width: 100%;
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

        <a class="nav-link active"
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
                <h2>Order Management</h2>
                <p>Monitor customer orders and payment information.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- PAGE HEADER -->

            <div class="page-header">

                <h1>Order Management 🛒</h1>

                <p>
                    Review customer orders, payment details, order status
                    and update the order lifecycle from one place.
                </p>

            </div>


            <!-- ALERTS -->

            <c:if test="${param.updated == '1'}">

                <div class="alert success">
                    ✅ Order status updated successfully!
                </div>

            </c:if>


            <c:if test="${param.error == '1'}">

                <div class="alert error">
                    ❌ Order status could not be updated.
                </div>

            </c:if>


            <!-- SUMMARY -->

            <div class="summary-card">

                <div class="summary-icon">
                    🛍️
                </div>

                <div>

                    <h3>Total Orders</h3>

                    <strong>
                        ${empty orders ? 0 : orders.size()}
                    </strong>

                </div>

            </div>


            <!-- ORDER LIST -->

            <div class="orders-section-header">

                <h2>Customer Orders</h2>

                <span>ShopSphere Order Management</span>

            </div>


            <c:if test="${empty orders}">

                <div class="empty-state">

                    <div class="icon">🛒</div>

                    <h3>No Orders Found</h3>

                    <p>
                        Customer orders will appear here after an order is placed.
                    </p>

                </div>

            </c:if>


            <c:if test="${not empty orders}">

                <div class="orders-grid">

                    <c:forEach var="order" items="${orders}">

                        <div class="order-card">

                            <!-- ORDER HEADER -->

                            <div class="order-top">

                                <div>

                                    <div class="order-id">
                                        Order #${order.orderId}
                                    </div>

                                    <div class="order-date">
                                        ${order.createdAt}
                                    </div>

                                </div>


                                <div class="status-badge">
                                    ${order.orderStatus}
                                </div>

                            </div>


                            <!-- ORDER INFO -->

                            <div class="info-grid">

                                <div class="info-box">

                                    <small>Customer ID</small>

                                    <strong>
                                        #${order.userId}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Payment Method</small>

                                    <strong>
                                        ${order.paymentMethod}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Payment Status</small>

                                    <strong>
                                        ${order.paymentStatus}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Order Status</small>

                                    <strong>
                                        ${order.orderStatus}
                                    </strong>

                                </div>

                            </div>


                            <!-- AMOUNT -->

                            <div class="amount-box">

                                <span>Total Amount</span>

                                <strong>
                                    ₹${order.totalAmount}
                                </strong>

                            </div>


                            <!-- UPDATE STATUS -->

                            <div class="update-section">

                                <div class="update-title">
                                    Update Order Status
                                </div>

                                <form class="status-form"
                                      action="${pageContext.request.contextPath}/admin/orders"
                                      method="post">

                                    <input type="hidden"
                                           name="action"
                                           value="updateStatus">

                                    <input type="hidden"
                                           name="orderId"
                                           value="${order.orderId}">

                                    <select name="orderStatus"
                                            required>

                                        <option value="PENDING"
                                            <c:if test="${order.orderStatus == 'PENDING'}">
                                                selected
                                            </c:if>>
                                            PENDING
                                        </option>

                                        <option value="PROCESSING"
                                            <c:if test="${order.orderStatus == 'PROCESSING'}">
                                                selected
                                            </c:if>>
                                            PROCESSING
                                        </option>

                                        <option value="SHIPPED"
                                            <c:if test="${order.orderStatus == 'SHIPPED'}">
                                                selected
                                            </c:if>>
                                            SHIPPED
                                        </option>

                                        <option value="DELIVERED"
                                            <c:if test="${order.orderStatus == 'DELIVERED'}">
                                                selected
                                            </c:if>>
                                            DELIVERED
                                        </option>

                                        <option value="COMPLETED"
                                            <c:if test="${order.orderStatus == 'COMPLETED'}">
                                                selected
                                            </c:if>>
                                            COMPLETED
                                        </option>

                                        <option value="CANCELLED"
                                            <c:if test="${order.orderStatus == 'CANCELLED'}">
                                                selected
                                            </c:if>>
                                            CANCELLED
                                        </option>

                                    </select>

                                    <button type="submit"
                                            class="update-btn">
                                        Update
                                    </button>

                                </form>

                            </div>


                            <!-- PAYMENT STATUS -->

                            <div class="status-row">

                                <span class="status-label">
                                    Current payment status
                                </span>

                                <span class="payment-status">
                                    ${order.paymentStatus}
                                </span>

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>


            <div class="footer-note">
                ShopSphere Admin Panel • Order Management
            </div>

        </section>

    </main>

</div>

</body>
</html>