<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - My Profile</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 10% 10%, rgba(99,102,241,.12), transparent 28%),
                radial-gradient(circle at 90% 20%, rgba(59,130,246,.10), transparent 25%),
                linear-gradient(135deg,#f8fbff,#eef3ff,#f9fbff);
            min-height: 100vh;
        }

        .page {
            padding: 50px 20px 70px;
        }

        .profile {
            max-width: 720px;
            margin: auto;
            background: rgba(255,255,255,.92);
            border-radius: 28px;
            padding: 35px;
            box-shadow: 0 20px 55px rgba(30,41,59,.10);
            border: 1px solid rgba(255,255,255,.95);
            backdrop-filter: blur(10px);
        }

        .profile-top {
            text-align: center;
            margin-bottom: 30px;
        }

        .avatar {
            width: 95px;
            height: 95px;
            margin: auto auto 18px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            color: white;
            background: linear-gradient(135deg,#2563eb,#7c3aed);
            box-shadow: 0 15px 30px rgba(37,99,235,.24);
        }

        .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        h1 {
            margin: 10px 0;
            font-size: 38px;
        }

        .profile-top p {
            color: #64748b;
        }

        .row {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            padding: 17px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .label {
            color: #64748b;
            font-weight: bold;
        }

        .value {
            color: #1e293b;
            font-weight: bold;
            text-align: right;
        }

        .role {
            padding: 6px 10px;
            border-radius: 999px;
            background: #e0e7ff;
            color: #4338ca;
        }

        .status {
            padding: 6px 10px;
            border-radius: 999px;
            background: #dcfce7;
            color: #15803d;
        }

        .back {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 19px;
            border-radius: 12px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }

        @media (max-width: 600px) {
            .row {
                flex-direction: column;
                gap: 7px;
            }

            .value {
                text-align: left;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="profile">

        <div class="profile-top">

            <div class="avatar">👤</div>

            <div class="small-title">SHOPSPHERE ACCOUNT</div>

            <h1>My Profile</h1>

            <p>Your account information</p>

        </div>

        <div class="row">
            <span class="label">User ID</span>
            <span class="value">${user.userId}</span>
        </div>

        <div class="row">
            <span class="label">Name</span>
            <span class="value">${user.name}</span>
        </div>

        <div class="row">
            <span class="label">Email</span>
            <span class="value">${user.email}</span>
        </div>

        <div class="row">
            <span class="label">Mobile</span>
            <span class="value">${user.mobile}</span>
        </div>

        <div class="row">
            <span class="label">Role</span>
            <span class="value role">${user.role}</span>
        </div>

        <div class="row">
            <span class="label">Status</span>
            <span class="value status">${user.status}</span>
        </div>

        <a class="back"
           href="/shopsphere/products">
            ← Back to Products
        </a>

    </div>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>