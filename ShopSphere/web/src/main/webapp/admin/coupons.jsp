<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Coupons</title>

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

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .full {
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
        select:focus {
            border-color: #6b7280;
            box-shadow: 0 0 0 3px rgba(107,114,128,0.10);
        }

        .btn-primary {
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

        /* COUPON LIST */
        .list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .list-header h2 {
            font-size: 22px;
        }

        .list-header span {
            color: #6b7280;
            font-size: 13px;
        }

        .coupon-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .coupon-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 23px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
        }

        .coupon-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.08);
        }

        .coupon-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 18px;
        }

        .coupon-icon {
            width: 52px;
            height: 52px;
            border-radius: 15px;
            background: #f3f4f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .coupon-status {
            padding: 6px 9px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-size: 11px;
            font-weight: bold;
        }

        .coupon-code {
            display: inline-block;
            background: #111827;
            color: white;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 20px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-bottom: 18px;
        }

        .coupon-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .info-box {
            background: #f9fafb;
            border: 1px solid #f0f0f0;
            border-radius: 10px;
            padding: 11px;
        }

        .info-box small {
            display: block;
            color: #9ca3af;
            font-size: 11px;
            margin-bottom: 5px;
        }

        .info-box strong {
            display: block;
            font-size: 13px;
            color: #374151;
            word-break: break-word;
        }

        .expiry {
            margin-top: 14px;
            padding-top: 14px;
            border-top: 1px solid #f0f0f0;
            color: #6b7280;
            font-size: 12px;
        }

        .expiry strong {
            color: #374151;
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
        @media (max-width: 1100px) {
            .coupon-grid {
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

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full {
                grid-column: auto;
            }

            .coupon-grid {
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

        <a class="nav-link active"
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
                <h2>Coupon Management</h2>
                <p>Create and manage promotional offers for customers.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-header">

                <h1>Coupon Management 🎟️</h1>

                <p>
                    Create promotional coupons, configure discount rules
                    and manage active offers for ShopSphere customers.
                </p>

            </div>


            <!-- ALERTS -->

            <c:if test="${param.success == '1'}">

                <div class="alert success">
                    ✅ Coupon added successfully!
                </div>

            </c:if>


            <c:if test="${param.error == '1'}">

                <div class="alert error">
                    ❌ Coupon could not be added.
                </div>

            </c:if>


            <!-- ADD COUPON -->

            <div class="form-box">

                <div class="card-title">

                    <div>
                        <h2>➕ Add New Coupon</h2>
                    </div>

                    <span>Create a promotional offer</span>

                </div>


                <form action="${pageContext.request.contextPath}/admin/coupons"
                      method="post">

                    <div class="form-grid">

                        <div>

                            <label>Coupon Code</label>

                            <input type="text"
                                   name="code"
                                   placeholder="SAVE20"
                                   required>

                        </div>


                        <div>

                            <label>Discount Type</label>

                            <select name="discountType" required>

                                <option value="PERCENTAGE">
                                    Percentage
                                </option>

                                <option value="FIXED">
                                    Fixed Amount
                                </option>

                            </select>

                        </div>


                        <div>

                            <label>Discount Value</label>

                            <input type="number"
                                   name="discountValue"
                                   placeholder="10"
                                   step="0.01"
                                   min="0"
                                   required>

                        </div>


                        <div>

                            <label>Minimum Order</label>

                            <input type="number"
                                   name="minimumOrder"
                                   placeholder="0"
                                   step="0.01"
                                   min="0"
                                   value="0"
                                   required>

                        </div>


                        <div>

                            <label>Maximum Discount</label>

                            <input type="number"
                                   name="maximumDiscount"
                                   placeholder="0"
                                   step="0.01"
                                   min="0"
                                   value="0"
                                   required>

                        </div>


                        <div>

                            <label>Expiry Date</label>

                            <input type="date"
                                   name="expiryDate"
                                   required>

                        </div>

                    </div>


                    <button type="submit"
                            class="btn-primary">
                        + Add Coupon
                    </button>

                </form>

            </div>


            <!-- EXISTING COUPONS -->

            <div class="list-header">

                <h2>Existing Coupons</h2>

                <span>ShopSphere Promotions</span>

            </div>


            <c:if test="${empty coupons}">

                <div class="empty-state">

                    <div class="icon">🎟️</div>

                    <h3>No Coupons Found</h3>

                    <p>
                        Create your first coupon using the form above.
                    </p>

                </div>

            </c:if>


            <c:if test="${not empty coupons}">

                <div class="coupon-grid">

                    <c:forEach var="coupon" items="${coupons}">

                        <div class="coupon-card">

                            <div class="coupon-top">

                                <div class="coupon-icon">
                                    🎟️
                                </div>

                                <span class="coupon-status">
                                    ${coupon.status}
                                </span>

                            </div>


                            <div class="coupon-code">
                                ${coupon.code}
                            </div>


                            <div class="coupon-info">

                                <div class="info-box">

                                    <small>Discount Type</small>

                                    <strong>
                                        ${coupon.discountType}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Discount Value</small>

                                    <strong>
                                        ${coupon.discountValue}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Minimum Order</small>

                                    <strong>
                                        ₹${coupon.minimumOrder}
                                    </strong>

                                </div>


                                <div class="info-box">

                                    <small>Maximum Discount</small>

                                    <strong>
                                        ₹${coupon.maximumDiscount}
                                    </strong>

                                </div>

                            </div>


                            <div class="expiry">

                                <strong>Expiry Date:</strong>
                                ${coupon.expiryDate}

                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>


            <div class="footer-note">
                ShopSphere Admin Panel • Coupon Management
            </div>

        </section>

    </main>

</div>

</body>
</html>