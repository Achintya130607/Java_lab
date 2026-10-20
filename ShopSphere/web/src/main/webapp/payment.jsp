<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Payment</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background:
                radial-gradient(circle at 10% 10%, rgba(37,99,235,.12), transparent 28%),
                radial-gradient(circle at 90% 80%, rgba(22,163,74,.10), transparent 26%),
                linear-gradient(135deg,#f8fbff,#eef3ff,#f9fbff);
            color: #172033;
        }

        .page {
            padding: 70px 20px;
        }

        .payment-card {
            max-width: 520px;
            margin: auto;
            padding: 36px;
            background: rgba(255,255,255,.92);
            border-radius: 28px;
            box-shadow: 0 22px 55px rgba(30,41,59,.10);
        }

        .icon {
            width: 75px;
            height: 75px;
            margin: auto auto 18px;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            color: white;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }

        h1 {
            text-align: center;
            margin: 0 0 22px;
        }

        .order {
            padding: 14px;
            border-radius: 13px;
            background: #f8fafc;
            margin-bottom: 12px;
        }

        .amount {
            padding: 20px;
            border-radius: 18px;
            text-align: center;
            font-size: 30px;
            font-weight: 800;
            color: #2563eb;
            background: #eef2ff;
            margin: 20px 0;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        select {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 12px;
        }

        button {
            width: 100%;
            margin-top: 18px;
            padding: 14px;
            border: 0;
            border-radius: 13px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="payment-card">

        <div class="icon">💳</div>

        <h1>Complete Payment</h1>

        <div class="order">
            <strong>Order ID:</strong>
            ${param.orderId}
        </div>

        <div class="amount">
            ₹${param.amount}
        </div>

        <form action="/shopsphere/payment"
              method="post">

            <input type="hidden"
                   name="orderId"
                   value="${param.orderId}">

            <input type="hidden"
                   name="amount"
                   value="${param.amount}">

            <label>Payment Method</label>

            <select name="paymentMethod"
                    required>

                <option value="MOCK">
                    Mock Payment
                </option>

                <option value="COD">
                    Cash on Delivery
                </option>

            </select>

            <button type="submit">
                Pay Now →
            </button>

        </form>

    </div>

</div>

</body>
</html>