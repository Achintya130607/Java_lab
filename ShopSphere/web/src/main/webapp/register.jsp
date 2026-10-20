<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Register</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            min-height: 100vh;
            background:
                radial-gradient(circle at 10% 15%, rgba(124,58,237,.15), transparent 28%),
                radial-gradient(circle at 90% 85%, rgba(37,99,235,.15), transparent 28%),
                linear-gradient(135deg,#f3f5ff,#eef5ff,#fbfbff);
        }

        .page {
            padding: 55px 20px 70px;
        }

        .auth-card {
            max-width: 500px;
            margin: auto;
            padding: 36px;
            border-radius: 28px;
            background: rgba(255,255,255,.93);
            box-shadow: 0 25px 60px rgba(30,41,59,.12);
            border: 1px solid rgba(255,255,255,.95);
            backdrop-filter: blur(12px);
        }

        .logo {
            width: 72px;
            height: 72px;
            margin: auto auto 18px;
            border-radius: 21px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 33px;
            color: white;
            background: linear-gradient(135deg,#7c3aed,#2563eb);
        }

        h1 {
            text-align: center;
            margin: 0 0 8px;
            font-size: 34px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 26px;
        }

        .success,
        .error {
            padding: 12px;
            border-radius: 12px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 16px;
        }

        .success {
            background: #ecfdf5;
            color: #15803d;
        }

        .error {
            background: #fef2f2;
            color: #b91c1c;
        }

        label {
            display: block;
            margin: 12px 0 7px;
            font-weight: bold;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 12px;
            outline: none;
            font-size: 15px;
        }

        input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,.12);
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 14px;
            border: 0;
            border-radius: 13px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            background: linear-gradient(135deg,#7c3aed,#2563eb);
            box-shadow: 0 12px 25px rgba(124,58,237,.22);
        }

        .bottom {
            text-align: center;
            margin-top: 22px;
            color: #64748b;
        }

        .bottom a {
            color: #4f46e5;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="page">

    <div class="auth-card">

        <div class="logo">👤</div>

        <h1>Create Account</h1>

        <div class="subtitle">
            Join ShopSphere and start shopping
        </div>

        <% if ("1".equals(request.getParameter("success"))) { %>
            <div class="success">
                Registration successful!
            </div>
        <% } %>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <div class="error">
                Registration failed. Please try again.
            </div>
        <% } %>

        <form action="/shopsphere/register" method="post">

            <label>Name</label>
            <input type="text"
                   name="name"
                   placeholder="Enter your name"
                   required>

            <label>Email</label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label>Password</label>
            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   required>

            <label>Mobile</label>
            <input type="text"
                   name="mobile"
                   placeholder="Enter mobile number"
                   required>

            <button type="submit">
                Create Account →
            </button>

        </form>

        <div class="bottom">
            Already have an account?
            <a href="/shopsphere/login">Login</a>
        </div>

    </div>

</div>

</body>
</html>