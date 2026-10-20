<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Admin Login</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background:
                radial-gradient(circle at top left, #374151 0%, transparent 35%),
                radial-gradient(circle at bottom right, #111827 0%, transparent 35%),
                linear-gradient(135deg, #111827, #1f2937, #374151);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
        }

        .page {
            width: 100%;
            max-width: 1000px;
            min-height: 620px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            background: rgba(255, 255, 255, 0.97);
            border-radius: 28px;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.28);
        }

        /* LEFT PANEL */

        .brand-panel {
            position: relative;
            background: linear-gradient(145deg, #111827, #1f2937 55%, #374151);
            color: white;
            padding: 55px 45px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
        }

        .brand-panel::before {
            content: "";
            position: absolute;
            width: 280px;
            height: 280px;
            border-radius: 50%;
            background: rgba(255,255,255,0.05);
            top: -100px;
            right: -90px;
        }

        .brand-panel::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.04);
            bottom: -80px;
            left: -70px;
        }

        .brand-content {
            position: relative;
            z-index: 2;
        }

        .logo-box {
            width: 70px;
            height: 70px;
            border-radius: 20px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            margin-bottom: 26px;
        }

        .brand-panel h1 {
            font-size: 40px;
            margin-bottom: 12px;
            letter-spacing: -1px;
        }

        .brand-panel h2 {
            font-size: 18px;
            color: #d1d5db;
            margin-bottom: 20px;
            font-weight: normal;
        }

        .brand-panel p {
            color: #9ca3af;
            font-size: 14px;
            line-height: 1.7;
            max-width: 380px;
        }

        .features {
            position: relative;
            z-index: 2;
            display: grid;
            gap: 12px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #d1d5db;
            font-size: 13px;
        }

        .feature-icon {
            width: 36px;
            height: 36px;
            border-radius: 10px;
            background: rgba(255,255,255,0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        .copyright {
            position: relative;
            z-index: 2;
            color: #6b7280;
            font-size: 11px;
            margin-top: 30px;
        }

        /* RIGHT PANEL */

        .login-panel {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 55px 50px;
            background: white;
        }

        .login-box {
            width: 100%;
            max-width: 380px;
        }

        .login-header {
            margin-bottom: 28px;
        }

        .login-header .mini-label {
            color: #6b7280;
            font-size: 11px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 9px;
        }

        .login-header h2 {
            font-size: 32px;
            color: #111827;
            margin-bottom: 8px;
        }

        .login-header p {
            color: #6b7280;
            font-size: 13px;
            line-height: 1.6;
        }

        .error {
            background: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 13px 15px;
            border-radius: 11px;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .form-group {
            margin-bottom: 19px;
        }

        label {
            display: block;
            color: #374151;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        .input-wrap {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
            opacity: 0.7;
        }

        input {
            width: 100%;
            padding: 13px 14px 13px 42px;
            border: 1px solid #d1d5db;
            border-radius: 11px;
            font-size: 14px;
            color: #111827;
            background: white;
            outline: none;
            transition: 0.2s ease;
        }

        input:focus {
            border-color: #374151;
            box-shadow: 0 0 0 4px rgba(55,65,81,0.10);
        }

        button {
            width: 100%;
            border: none;
            border-radius: 11px;
            padding: 14px;
            margin-top: 5px;
            background: linear-gradient(135deg, #111827, #374151);
            color: white;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: 0.2s ease;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 22px rgba(17,24,39,0.20);
        }

        .security-note {
            margin-top: 20px;
            padding: 13px 14px;
            border-radius: 11px;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 11px;
            line-height: 1.6;
            text-align: center;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #6b7280;
            font-size: 12px;
        }

        .back-link:hover {
            color: #111827;
            text-decoration: underline;
        }

        /* MOBILE */

        @media (max-width: 800px) {

            .page {
                grid-template-columns: 1fr;
                max-width: 520px;
                min-height: auto;
            }

            .brand-panel {
                padding: 35px 30px;
            }

            .brand-panel h1 {
                font-size: 32px;
            }

            .features {
                margin-top: 30px;
            }

            .copyright {
                margin-top: 25px;
            }

            .login-panel {
                padding: 40px 30px;
            }
        }

        @media (max-width: 500px) {

            body {
                padding: 12px;
            }

            .page {
                border-radius: 20px;
            }

            .brand-panel {
                padding: 30px 22px;
            }

            .login-panel {
                padding: 32px 22px;
            }

            .login-header h2 {
                font-size: 27px;
            }
        }

    </style>

</head>

<body>

<div class="page">

    <!-- LEFT -->
    <section class="brand-panel">

        <div class="brand-content">

            <div class="logo-box">
                🛍️
            </div>

            <h1>ShopSphere</h1>

            <h2>Admin Control Center</h2>

            <p>
                Manage your complete e-commerce platform from one secure
                administration panel. Products, orders, customers,
                coupons and reports — everything in one place.
            </p>

        </div>


        <div class="features">

            <div class="feature">
                <div class="feature-icon">📦</div>
                Product Management
            </div>

            <div class="feature">
                <div class="feature-icon">🛒</div>
                Order Management
            </div>

            <div class="feature">
                <div class="feature-icon">👥</div>
                Customer Management
            </div>

            <div class="feature">
                <div class="feature-icon">📊</div>
                Reports & Analytics
            </div>

        </div>


        <div class="copyright">
            ShopSphere • RTU Advanced Java Project
        </div>

    </section>


    <!-- RIGHT -->
    <section class="login-panel">

        <div class="login-box">

            <div class="login-header">

                <div class="mini-label">
                    Secure Administration
                </div>

                <h2>Welcome Back 👋</h2>

                <p>
                    Sign in with your administrator account to access
                    the ShopSphere control panel.
                </p>

            </div>


            <% if ("1".equals(request.getParameter("error"))) { %>

                <div class="error">
                    ❌ Invalid admin email or password.
                </div>

            <% } %>


            <form action="login" method="post">

                <div class="form-group">

                    <label>Email Address</label>

                    <div class="input-wrap">

                        <span class="input-icon">
                            ✉️
                        </span>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter admin email"
                            autocomplete="username"
                            required>

                    </div>

                </div>


                <div class="form-group">

                    <label>Password</label>

                    <div class="input-wrap">

                        <span class="input-icon">
                            🔒
                        </span>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter admin password"
                            autocomplete="current-password"
                            required>

                    </div>

                </div>


                <button type="submit">
                    🔐 Admin Login
                </button>

            </form>


            <div class="security-note">
                🔒 Your administrator credentials are protected by
                ShopSphere's authentication system.
            </div>


            <a class="back-link"
               href="${pageContext.request.contextPath}/">
                ← Back to ShopSphere Store
            </a>

        </div>

    </section>

</div>

</body>
</html>