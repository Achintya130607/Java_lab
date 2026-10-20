<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Payment Successful</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(34,197,94,.16), transparent 30%),
                radial-gradient(circle at 90% 90%, rgba(59,130,246,.10), transparent 28%),
                linear-gradient(135deg,#f0fdf4,#eff6ff,#f9fbff);
        }

        .page {
            padding: 80px 20px;
        }

        .card {
            max-width: 600px;
            margin: auto;
            text-align: center;
            padding: 50px 35px;
            background: rgba(255,255,255,.92);
            border-radius: 30px;
            box-shadow: 0 25px 60px rgba(30,41,59,.10);
        }

        .icon {
            width: 95px;
            height: 95px;
            margin: auto auto 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 46px;
            background: #dcfce7;
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
            margin: 20px 0;
            padding: 12px 18px;
            border-radius: 12px;
            background: #f8fafc;
            font-weight: bold;
            color: #1e293b;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        a {
            display: inline-block;
            padding: 13px 20px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: bold;
        }

        .primary {
            color: white;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }

        .secondary {
            color: #334155;
            background: #eef2ff;
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="card">

        <div class="icon">✓</div>

        <h1>Payment Successful!</h1>

        <p>
            Your payment has been completed successfully.
        </p>

        <div class="order-id">
            Order ID: ${param.orderId}
        </div>

        <div class="actions">

            <a class="primary"
               href="/shopsphere/orders">
                View My Orders
            </a>

            <a class="secondary"
               href="/shopsphere/products">
                Continue Shopping
            </a>

        </div>

    </div>

</div>

</body>
</html>