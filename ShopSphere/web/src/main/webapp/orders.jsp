<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - My Orders</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(59,130,246,.10), transparent 28%),
                radial-gradient(circle at 95% 10%, rgba(99,102,241,.10), transparent 26%),
                linear-gradient(135deg,#f8fbff,#eef3ff,#f9fbff);
        }

        .page {
            padding: 45px 5% 70px;
        }

        .header {
            text-align: center;
            max-width: 700px;
            margin: auto auto 38px;
        }

        .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
        }

        h1 {
            font-size: 42px;
            margin: 10px 0;
        }

        .header p {
            color: #64748b;
        }

        .orders {
            max-width: 950px;
            margin: auto;
        }

        .order-card {
            background: rgba(255,255,255,.90);
            border-radius: 22px;
            padding: 24px;
            margin-bottom: 18px;
            box-shadow: 0 16px 40px rgba(30,41,59,.08);
            border: 1px solid rgba(255,255,255,.95);
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .order-id {
            font-size: 22px;
            font-weight: 800;
        }

        .status {
            padding: 8px 13px;
            border-radius: 999px;
            background: #e0e7ff;
            color: #4338ca;
            font-size: 13px;
            font-weight: bold;
        }

        .details {
            display: grid;
            grid-template-columns: repeat(4,1fr);
            gap: 14px;
        }

        .detail {
            padding: 14px;
            border-radius: 14px;
            background: #f8fafc;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            margin-bottom: 7px;
        }

        .detail-value {
            font-weight: bold;
            color: #1e293b;
        }

        .amount {
            color: #2563eb;
            font-size: 20px;
        }

        .empty {
            max-width: 650px;
            margin: 70px auto;
            text-align: center;
            padding: 55px 25px;
            background: rgba(255,255,255,.90);
            border-radius: 26px;
            box-shadow: 0 20px 50px rgba(30,41,59,.09);
        }

        .empty-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .empty h2 {
            margin-bottom: 10px;
        }

        .empty p {
            color: #64748b;
        }

        .shop {
            display: inline-block;
            margin-top: 15px;
            padding: 13px 20px;
            text-decoration: none;
            border-radius: 12px;
            color: white;
            font-weight: bold;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
        }

        @media (max-width: 800px) {
            .details {
                grid-template-columns: repeat(2,1fr);
            }
        }

        @media (max-width: 520px) {
            .details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="header">
        <div class="small-title">SHOPSPHERE ORDER HISTORY</div>
        <h1>My Orders</h1>
        <p>Track your recent purchases and order status.</p>
    </div>

    <c:if test="${empty orders}">

        <div class="empty">
            <div class="empty-icon">📦</div>
            <h2>No orders found</h2>
            <p>You haven't placed any orders yet.</p>

            <a class="shop"
               href="/shopsphere/products">
                Start Shopping
            </a>
        </div>

    </c:if>

    <c:if test="${not empty orders}">

        <div class="orders">

            <c:forEach var="order"
                       items="${orders}">

                <div class="order-card">

                    <div class="top">

                        <div class="order-id">
                            Order #${order.orderId}
                        </div>

                        <div class="status">
                            ${order.orderStatus}
                        </div>

                    </div>

                    <div class="details">

                        <div class="detail">
                            <span class="detail-label">Total Amount</span>
                            <span class="detail-value amount">
                                ₹${order.totalAmount}
                            </span>
                        </div>

                        <div class="detail">
                            <span class="detail-label">Payment Method</span>
                            <span class="detail-value">
                                ${order.paymentMethod}
                            </span>
                        </div>

                        <div class="detail">
                            <span class="detail-label">Payment Status</span>
                            <span class="detail-value">
                                ${order.paymentStatus}
                            </span>
                        </div>

                        <div class="detail">
                            <span class="detail-label">Order Date</span>
                            <span class="detail-value">
                                ${order.createdAt}
                            </span>
                        </div>

                    </div>

                </div>

            </c:forEach>

        </div>

    </c:if>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>