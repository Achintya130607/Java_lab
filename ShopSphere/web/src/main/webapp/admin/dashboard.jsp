<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Dashboard</title>

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

        .nav-link:hover {
            background: rgba(255,255,255,0.10);
            color: white;
            transform: translateX(2px);
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

        .topbar-left h2 {
            font-size: 20px;
            margin-bottom: 4px;
        }

        .topbar-left p {
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

        .welcome {
            background: linear-gradient(135deg, #111827, #374151);
            color: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 28px;
            box-shadow: 0 12px 30px rgba(17,24,39,0.14);
        }

        .welcome h1 {
            font-size: 30px;
            margin-bottom: 8px;
        }

        .welcome p {
            color: #d1d5db;
            font-size: 14px;
            line-height: 1.6;
        }

        /* STATS */
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.05);
        }

        .stat-icon {
            font-size: 25px;
            margin-bottom: 13px;
        }

        .stat-card h3 {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 6px;
        }

        .stat-card strong {
            font-size: 25px;
        }

        /* SECTION */
        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 17px;
        }

        .section-heading h2 {
            font-size: 21px;
        }

        .section-heading span {
            color: #6b7280;
            font-size: 13px;
        }

        /* CARDS */
        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 18px;
            padding: 24px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            transition: 0.22s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 175px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 32px rgba(0,0,0,0.09);
        }

        .card-top {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
        }

        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f3f4f6;
            font-size: 23px;
        }

        .card h3 {
            font-size: 19px;
            margin: 16px 0 7px;
        }

        .card p {
            color: #6b7280;
            font-size: 13px;
            line-height: 1.5;
        }

        .card-button {
            display: inline-block;
            margin-top: 18px;
            color: #111827;
            font-weight: bold;
            font-size: 13px;
        }

        .card-button:hover {
            text-decoration: underline;
        }

        .footer-note {
            margin-top: 35px;
            text-align: center;
            color: #9ca3af;
            font-size: 12px;
            padding-bottom: 15px;
        }

        /* MOBILE */
        @media (max-width: 1100px) {
            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .cards {
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

            .cards {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 650px) {
            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
            }

            .main {
                margin-left: 0;
                width: 100%;
            }

            .layout {
                flex-direction: column;
            }

            .topbar {
                position: relative;
            }

            .content {
                padding: 20px;
            }

            .stats {
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

        <a class="nav-link" href="/shopsphere/admin/dashboard.jsp">
            <span class="nav-icon">🏠</span>
            Dashboard
        </a>

        <a class="nav-link" href="/shopsphere/admin/products">
            <span class="nav-icon">📦</span>
            Products
        </a>

        <a class="nav-link" href="/shopsphere/admin/categories">
            <span class="nav-icon">🗂️</span>
            Categories
        </a>

        <a class="nav-link" href="/shopsphere/admin/orders">
            <span class="nav-icon">🛒</span>
            Orders
        </a>

        <a class="nav-link" href="/shopsphere/admin/users">
            <span class="nav-icon">👥</span>
            Customers
        </a>

        <a class="nav-link" href="/shopsphere/admin/coupons">
            <span class="nav-icon">🎟️</span>
            Coupons
        </a>

        <a class="nav-link" href="/shopsphere/admin/reports">
            <span class="nav-icon">📊</span>
            Reports
        </a>

        <div class="logout">
            <a class="nav-link" href="/shopsphere/logout">
                <span class="nav-icon">🚪</span>
                Logout
            </a>
        </div>

    </aside>


    <!-- MAIN -->
    <main class="main">

        <header class="topbar">

            <div class="topbar-left">
                <h2>Admin Dashboard</h2>
                <p>Manage your ShopSphere store from one place.</p>
            </div>

            <div class="admin-badge">
                👨‍💼 Administrator
            </div>

        </header>


        <section class="content">

            <!-- WELCOME -->
            <div class="welcome">
                <h1>Welcome, Admin 👋</h1>
                <p>
                    Manage products, categories, customers, orders, coupons
                    and reports from your ShopSphere administration panel.
                </p>
            </div>


            <!-- QUICK STATS -->
            <div class="stats">

                <div class="stat-card">
                    <div class="stat-icon">📦</div>
                    <h3>Product Management</h3>
                    <strong>Active</strong>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">🛒</div>
                    <h3>Order Management</h3>
                    <strong>Active</strong>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">👥</div>
                    <h3>Customer Management</h3>
                    <strong>Active</strong>
                </div>

                <div class="stat-card">
                    <div class="stat-icon">📊</div>
                    <h3>Reports</h3>
                    <strong>Ready</strong>
                </div>

            </div>


            <!-- MANAGEMENT -->
            <div class="section-heading">
                <h2>Management Center</h2>
                <span>Quick access to admin modules</span>
            </div>


            <div class="cards">

                <!-- PRODUCTS -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Products</h3>
                                <p>Add, edit and manage store products.</p>
                            </div>

                            <div class="card-icon">📦</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/products">
                        Manage Products →
                    </a>
                </div>


                <!-- CATEGORIES -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Categories</h3>
                                <p>Manage product categories and details.</p>
                            </div>

                            <div class="card-icon">🗂️</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/categories">
                        Manage Categories →
                    </a>
                </div>


                <!-- ORDERS -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Orders</h3>
                                <p>View customer orders and update status.</p>
                            </div>

                            <div class="card-icon">🛒</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/orders">
                        Manage Orders →
                    </a>
                </div>


                <!-- CUSTOMERS -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Customers</h3>
                                <p>View and manage registered customers.</p>
                            </div>

                            <div class="card-icon">👥</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/users">
                        View Customers →
                    </a>
                </div>


                <!-- COUPONS -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Coupons</h3>
                                <p>Create and manage promotional coupons.</p>
                            </div>

                            <div class="card-icon">🎟️</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/coupons">
                        Manage Coupons →
                    </a>
                </div>


                <!-- REPORTS -->
                <div class="card">
                    <div>
                        <div class="card-top">
                            <div>
                                <h3>Reports</h3>
                                <p>Check sales and store performance reports.</p>
                            </div>

                            <div class="card-icon">📊</div>
                        </div>
                    </div>

                    <a class="card-button"
                       href="/shopsphere/admin/reports">
                        View Reports →
                    </a>
                </div>

            </div>


            <div class="footer-note">
                ShopSphere Admin Panel • RTU Advanced Java Project
            </div>

        </section>

    </main>

</div>

</body>
</html>