<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Checkout</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(99,102,241,.10), transparent 28%),
                radial-gradient(circle at 95% 10%, rgba(34,197,94,.09), transparent 25%),
                linear-gradient(135deg,#f8fbff,#eef3ff,#f9fbff);
        }

        .page {
            padding: 45px 5% 70px;
        }

        .header {
            max-width: 1000px;
            margin: auto;
            text-align: center;
            margin-bottom: 35px;
        }

        .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        h1 {
            margin: 10px 0;
            font-size: 42px;
        }

        .header p {
            color: #64748b;
        }

        .layout {
            max-width: 1000px;
            margin: auto;
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 25px;
        }

        .panel {
            background: rgba(255,255,255,.90);
            border-radius: 24px;
            padding: 26px;
            box-shadow: 0 18px 45px rgba(30,41,59,.08);
            border: 1px solid rgba(255,255,255,.95);
            backdrop-filter: blur(10px);
        }

        .panel h2 {
            margin-top: 0;
            font-size: 24px;
        }

        .summary-line {
            display: flex;
            justify-content: space-between;
            padding: 13px 0;
            border-bottom: 1px solid #e2e8f0;
            color: #475569;
        }

        .discount {
            color: #16a34a;
            font-weight: bold;
        }

        .final {
            display: flex;
            justify-content: space-between;
            padding-top: 20px;
            font-size: 24px;
            font-weight: 800;
        }

        .final span:last-child {
            color: #2563eb;
        }

        .success {
            padding: 13px;
            border-radius: 12px;
            background: #ecfdf5;
            color: #15803d;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .error {
            padding: 13px;
            border-radius: 12px;
            background: #fef2f2;
            color: #b91c1c;
            font-weight: bold;
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 7px;
            font-weight: bold;
            color: #334155;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 11px;
            font-size: 15px;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,.12);
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 15px;
            border: 0;
            border-radius: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .coupon-btn {
            color: #334155;
            background: #eef2ff;
        }

        .order-btn {
            color: white;
            background: linear-gradient(135deg,#16a34a,#15803d);
            box-shadow: 0 12px 24px rgba(22,163,74,.20);
        }

        .secure {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            margin-top: 14px;
        }

        @media (max-width: 820px) {
            .layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="header">
        <div class="small-title">SECURE SHOPSPHERE CHECKOUT</div>
        <h1>Complete Your Order</h1>
        <p>Enter your delivery details and choose your payment method.</p>
    </div>

    <div class="layout">

        <div class="panel">

            <h2>Order Summary</h2>

            <div class="summary-line">
                <span>Total Amount</span>
                <span>₹${totalAmount}</span>
            </div>

            <div class="summary-line discount">
                <span>Discount</span>
                <span>₹${discount}</span>
            </div>

            <c:if test="${not empty couponCode}">
                <div class="summary-line">
                    <span>Coupon</span>
                    <span>${couponCode}</span>
                </div>
            </c:if>

            <div class="final">
                <span>Final Amount</span>
                <span>₹${finalAmount}</span>
            </div>

        </div>

        <div class="panel">

            <c:if test="${param.error == 'address'}">
                <div class="error">
                    Address could not be saved.
                </div>
            </c:if>

            <c:if test="${param.error == 'order'}">
                <div class="error">
                    Order could not be created.
                </div>
            </c:if>

            <c:if test="${not empty couponCode}">
                <div class="success">
                    Coupon ${couponCode} applied successfully!
                </div>
            </c:if>

            <h2>Coupon</h2>

            <form action="/shopsphere/checkout" method="get">

                <label>Coupon Code</label>

                <input type="text"
                       name="coupon"
                       placeholder="Enter coupon code">

                <button class="coupon-btn"
                        type="submit">
                    Apply Coupon
                </button>

            </form>

            <h2 style="margin-top:30px;">Delivery & Payment</h2>

            <form action="/shopsphere/checkout"
                  method="post">

                <label>Address</label>
                <input type="text"
                       name="addressLine"
                       placeholder="House / Street address"
                       required>

                <label>City</label>
                <input type="text"
                       name="city"
                       required>

                <label>State</label>
                <input type="text"
                       name="state"
                       required>

                <label>Pincode</label>
                <input type="text"
                       name="pincode"
                       required>

                <label>Address Type</label>
                <select name="addressType" required>
                    <option value="HOME">Home</option>
                    <option value="OFFICE">Office</option>
                </select>

                <label>Payment Method</label>
                <select name="paymentMethod" required>
                    <option value="COD">Cash on Delivery</option>
                    <option value="MOCK">Mock Payment</option>
                </select>

                <input type="hidden"
                       name="couponCode"
                       value="${couponCode}">

                <button class="order-btn"
                        type="submit">
                    Place Order →
                </button>

            </form>

            <div class="secure">
                🔒 Your checkout is protected by ShopSphere
            </div>

        </div>

    </div>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>