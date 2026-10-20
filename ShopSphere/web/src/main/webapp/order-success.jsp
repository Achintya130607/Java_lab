<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Order Success</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(34,197,94,.16), transparent 30%),
                radial-gradient(circle at 90% 80%, rgba(99,102,241,.10), transparent 28%),
                linear-gradient(135deg,#f0fdf4,#eef2ff,#f9fbff);
        }

        .page {
            padding: 85px 20px;
        }

        .card {
            max-width: 620px;
            margin: auto;
            text-align: center;
            padding: 55px 35px;
            background: rgba(255,255,255,.93);
            border-radius: 30px;
            box-shadow: 0 25px 60px rgba(30,41,59,.10);
        }

        .icon {
            width: 100px;
            height: 100px;
            margin: auto auto 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            background: #dcfce7;
            color: #15803d;
        }

        h1 {
            color: #15803d;
            margin-bottom: 12px;
        }

        p {
            color: #64748b;
        }

        .order-id {
            display: inline-block;
            margin: 22px 0;
            padding: 13px 20px;
            border-radius: 13px;
            background: #f8fafc;
            font-weight: bold;
        }

        a {
            display: inline-block;
            margin-top: 8px;
            padding: 13px 22px;
            border-radius: 13px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="card">

        <div class="icon">✓</div>

        <h1>Order Placed Successfully!</h1>

        <p>
            Your order has been placed successfully.
        </p>

        <div class="order-id">
            Order ID: ${param.orderId}
        </div>

        <br>

        <a href="/shopsphere/products">
            Continue Shopping →
        </a>

    </div>

</div>

</body>
</html>