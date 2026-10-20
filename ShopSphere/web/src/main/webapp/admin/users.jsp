<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Customers</title>

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
        .summary-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 18px 20px;
            margin-bottom: 26px;
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

        /* HEADER */
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

        /* USER GRID */
        .user-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .user-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 23px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
        }

        .user-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.08);
        }

        .user-top {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 12px;
            margin-bottom: 20px;
        }

        .avatar {
            width: 55px;
            height: 55px;
            border-radius: 16px;
            background: linear-gradient(135deg, #e5e7eb, #f3f4f6);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            font-weight: bold;
            color: #374151;
        }

        .user-head {
            flex: 1;
        }

        .user-head h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .user-id {
            color: #9ca3af;
            font-size: 12px;
        }

        .status-badge {
            padding: 6px 9px;
            border-radius: 20px;
            background: #ecfdf5;
            color: #047857;
            font-size: 11px;
            font-weight: bold;
        }

        .info-list {
            margin-top: 10px;
        }

        .info-row {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            padding: 11px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-icon {
            width: 25px;
            text-align: center;
            font-size: 16px;
        }

        .info-content small {
            display: block;
            color: #9ca3af;
            font-size: 11px;
            margin-bottom: 3px;
        }

        .info-content strong {
            color: #374151;
            font-size: 13px;
            word-break: break-word;
        }

        .role-badge {
            display: inline-block;
            margin-top: 16px;
            padding: 7px 10px;
            border-radius: 8px;
            background: #f3f4f6;
            color: #374151;
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
        @media (max-width: 1100px) {
            .user-grid {
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

            .user-grid {
                grid-template-columns: 1fr;
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

        <a class="nav-link active"
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
                <h2>Customer Management</h2>
                <p>View registered ShopSphere users and account details.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- PAGE HEADER -->
            <div class="page-header">

                <h1>Customer Management 👥</h1>

                <p>
                    View customer accounts, contact information, roles
                    and account status from the ShopSphere admin panel.
                </p>

            </div>


            <!-- SUMMARY -->

            <div class="summary-card">

                <div class="summary-icon">
                    👥
                </div>

                <div>

                    <h3>Total Users</h3>

                    <strong>
                        ${empty users ? 0 : users.size()}
                    </strong>

                </div>

            </div>


            <!-- USER LIST -->

            <div class="list-header">

                <h2>Registered Users</h2>

                <span>ShopSphere Customer Directory</span>

            </div>


            <c:if test="${empty users}">

                <div class="empty-state">

                    <div class="icon">👥</div>

                    <h3>No Users Found</h3>

                    <p>
                        Registered users will appear here.
                    </p>

                </div>

            </c:if>


            <c:if test="${not empty users}">

                <div class="user-grid">

                    <c:forEach var="user" items="${users}">

                        <div class="user-card">

                            <div class="user-top">

                                <div class="avatar">

                                    <c:choose>

                                        <c:when test="${not empty user.name}">
                                            ${user.name.substring(0,1).toUpperCase()}
                                        </c:when>

                                        <c:otherwise>
                                            👤
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <div class="user-head">

                                    <h3>
                                        ${user.name}
                                    </h3>

                                    <div class="user-id">
                                        User ID #${user.userId}
                                    </div>

                                </div>


                                <span class="status-badge">
                                    ${user.status}
                                </span>

                            </div>


                            <div class="info-list">

                                <div class="info-row">

                                    <div class="info-icon">
                                        ✉️
                                    </div>

                                    <div class="info-content">

                                        <small>Email</small>

                                        <strong>
                                            ${user.email}
                                        </strong>

                                    </div>

                                </div>


                                <div class="info-row">

                                    <div class="info-icon">
                                        📱
                                    </div>

                                    <div class="info-content">

                                        <small>Mobile</small>

                                        <strong>
                                            ${user.mobile}
                                        </strong>

                                    </div>

                                </div>


                                <div class="info-row">

                                    <div class="info-icon">
                                        🛡️
                                    </div>

                                    <div class="info-content">

                                        <small>Account Role</small>

                                        <strong>
                                            ${user.role}
                                        </strong>

                                    </div>

                                </div>

                            </div>


                            <div class="role-badge">
                                ROLE: ${user.role}
                            </div>

                        </div>

                    </c:forEach>

                </div>

            </c:if>


            <div class="footer-note">
                ShopSphere Admin Panel • Customer Management
            </div>

        </section>

    </main>

</div>

</body>
</html>