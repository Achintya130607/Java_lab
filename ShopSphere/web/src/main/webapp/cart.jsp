<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Cart</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(99, 102, 241, 0.10), transparent 28%),
                radial-gradient(circle at 95% 15%, rgba(59, 130, 246, 0.10), transparent 25%),
                linear-gradient(135deg, #f8fbff, #eef3ff, #f9fbff);
            min-height: 100vh;
        }

        .page {
            padding: 42px 5% 70px;
        }

        .page-header {
            max-width: 1200px;
            margin: 0 auto 35px;
        }

        .page-header .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
            margin-bottom: 10px;
        }

        .page-header h1 {
            margin: 0;
            font-size: 42px;
            letter-spacing: -1px;
        }

        .page-header p {
            margin-top: 10px;
            color: #64748b;
            font-size: 16px;
        }

        .message {
            max-width: 1200px;
            margin: 0 auto 22px;
            padding: 14px 18px;
            border-radius: 14px;
            font-weight: bold;
        }

        .error {
            color: #b91c1c;
            background: #fef2f2;
            border: 1px solid #fecaca;
        }

        .empty {
            max-width: 700px;
            margin: 70px auto;
            padding: 60px 30px;
            text-align: center;
            background: rgba(255,255,255,0.88);
            border: 1px solid rgba(255,255,255,0.95);
            border-radius: 28px;
            box-shadow: 0 20px 50px rgba(30,41,59,0.10);
            backdrop-filter: blur(10px);
        }

        .empty-icon {
            width: 90px;
            height: 90px;
            margin: 0 auto 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            background: #dbeafe;
        }

        .empty h2 {
            margin: 0 0 10px;
            font-size: 28px;
        }

        .empty p {
            color: #64748b;
            margin-bottom: 25px;
        }

        .continue-btn {
            display: inline-block;
            padding: 13px 22px;
            border-radius: 13px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            box-shadow: 0 10px 22px rgba(37,99,235,0.24);
        }

        .cart-layout {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: minmax(0, 1fr) 330px;
            gap: 28px;
            align-items: start;
        }

        .items {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .cart-item {
            position: relative;
            display: grid;
            grid-template-columns: 120px minmax(0,1fr);
            gap: 22px;
            padding: 20px;
            background: rgba(255,255,255,0.90);
            border: 1px solid rgba(255,255,255,0.95);
            border-radius: 22px;
            box-shadow: 0 16px 40px rgba(30,41,59,0.08);
            backdrop-filter: blur(10px);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .cart-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 46px rgba(30,41,59,0.12);
        }

        .product-image {
            width: 120px;
            height: 120px;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            background: linear-gradient(135deg, #dbeafe, #c7d2fe);
        }

        .cart-item:nth-child(2) .product-image {
            background: linear-gradient(135deg, #dcfce7, #d1fae5);
        }

        .cart-item:nth-child(3) .product-image {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
        }

        .cart-item:nth-child(4) .product-image {
            background: linear-gradient(135deg, #fce7f3, #fbcfe8);
        }

        .product-info h2 {
            margin: 0 0 8px;
            font-size: 24px;
        }

        .brand {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 12px;
        }

        .details {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 13px;
        }

        .detail-pill {
            padding: 7px 10px;
            border-radius: 10px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #475569;
            font-size: 13px;
        }

        .price-row {
            display: flex;
            align-items: center;
            gap: 18px;
            margin-bottom: 16px;
        }

        .price {
            font-size: 22px;
            font-weight: 800;
            color: #111827;
        }

        .subtotal {
            color: #2563eb;
            font-size: 14px;
            font-weight: bold;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .quantity-form {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .quantity-label {
            color: #475569;
            font-size: 14px;
            font-weight: bold;
        }

        .quantity-input {
            width: 72px;
            padding: 10px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-size: 14px;
            outline: none;
        }

        .quantity-input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.12);
        }

        .update-btn,
        .remove-btn {
            border: none;
            border-radius: 10px;
            padding: 10px 15px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .update-btn {
            color: white;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
        }

        .remove-btn {
            color: #dc2626;
            background: #fee2e2;
        }

        .update-btn:hover,
        .remove-btn:hover {
            transform: translateY(-2px);
        }

        .summary {
            position: sticky;
            top: 20px;
            padding: 26px;
            border-radius: 24px;
            background: rgba(255,255,255,0.90);
            border: 1px solid rgba(255,255,255,0.95);
            box-shadow: 0 18px 45px rgba(30,41,59,0.10);
            backdrop-filter: blur(10px);
        }

        .summary h2 {
            margin-top: 0;
            margin-bottom: 22px;
            font-size: 25px;
        }

        .summary-line {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 13px 0;
            border-bottom: 1px solid #e2e8f0;
            color: #475569;
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding-top: 20px;
            font-size: 22px;
            font-weight: 800;
        }

        .summary-total span:last-child {
            color: #2563eb;
        }

        .checkout {
            display: block;
            margin-top: 22px;
            padding: 14px 20px;
            text-align: center;
            border-radius: 14px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: linear-gradient(135deg, #16a34a, #15803d);
            box-shadow: 0 12px 24px rgba(22,163,74,0.22);
            transition: all 0.2s ease;
        }

        .checkout:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(22,163,74,0.28);
        }

        .secure-note {
            margin-top: 15px;
            text-align: center;
            color: #64748b;
            font-size: 13px;
        }

        @media (max-width: 900px) {
            .cart-layout {
                grid-template-columns: 1fr;
            }

            .summary {
                position: static;
            }
        }

        @media (max-width: 600px) {
            .page {
                padding: 30px 16px 50px;
            }

            .page-header h1 {
                font-size: 32px;
            }

            .cart-item {
                grid-template-columns: 1fr;
            }

            .product-image {
                width: 100%;
                height: 130px;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="page-header">
        <div class="small-title">SHOPSPHERE SHOPPING BAG</div>

        <h1>Your Cart</h1>

        <p>
            Review your selected products before proceeding to checkout.
        </p>
    </div>

    <c:if test="${param.error == '1'}">
        <div class="message error">
            Cart operation failed. Please try again.
        </div>
    </c:if>

    <c:if test="${empty cartItems}">

        <div class="empty">

            <div class="empty-icon">
                🛒
            </div>

            <h2>Your cart is empty</h2>

            <p>
                Looks like you haven't added anything to your cart yet.
            </p>

            <a class="continue-btn"
               href="/shopsphere/products">
                🛍️ Continue Shopping
            </a>

        </div>

    </c:if>

    <c:if test="${not empty cartItems}">

        <c:set var="cartTotal" value="0" />

        <div class="cart-layout">

            <div class="items">

                <c:forEach var="item"
                           items="${cartItems}"
                           varStatus="status">

                    <c:set var="itemSubtotal"
                           value="${item.product.price * item.quantity}" />

                    <c:set var="cartTotal"
                           value="${cartTotal + itemSubtotal}" />

                    <div class="cart-item">

                        <div class="product-image">

                            <c:choose>

                                <c:when test="${item.product.name.toLowerCase().contains('phone')}">
                                    📱
                                </c:when>

                                <c:when test="${item.product.name.toLowerCase().contains('laptop')}">
                                    💻
                                </c:when>

                                <c:when test="${item.product.name.toLowerCase().contains('shirt')}">
                                    👕
                                </c:when>

                                <c:when test="${item.product.name.toLowerCase().contains('mixer')}">
                                    🍳
                                </c:when>

                                <c:when test="${item.product.name.toLowerCase().contains('book')}">
                                    📚
                                </c:when>

                                <c:when test="${item.product.name.toLowerCase().contains('football')}">
                                    ⚽
                                </c:when>

                                <c:otherwise>
                                    🛍️
                                </c:otherwise>

                            </c:choose>

                        </div>

                        <div class="product-info">

                            <h2>
                                ${item.product.name}
                            </h2>

                            <div class="brand">
                                Brand: ${item.product.brand}
                            </div>

                            <div class="details">

                                <div class="detail-pill">
                                    Price: ₹${item.product.price}
                                </div>

                                <div class="detail-pill">
                                    Available: ${item.product.stock}
                                </div>

                            </div>

                            <div class="price-row">

                                <div class="price">
                                    ₹${item.product.price}
                                </div>

                                <div class="subtotal">
                                    Subtotal: ₹${itemSubtotal}
                                </div>

                            </div>

                            <div class="actions">

                                <!-- Update Quantity -->
                                <form class="quantity-form"
                                      action="/shopsphere/cart"
                                      method="post">

                                    <input type="hidden"
                                           name="action"
                                           value="update">

                                    <input type="hidden"
                                           name="cartId"
                                           value="${item.cartId}">

                                    <label class="quantity-label">
                                        Qty
                                    </label>

                                    <input class="quantity-input"
                                           type="number"
                                           name="quantity"
                                           value="${item.quantity}"
                                           min="1"
                                           max="${item.product.stock}"
                                           required>

                                    <button class="update-btn"
                                            type="submit">
                                        Update
                                    </button>

                                </form>

                                <!-- Remove Item -->
                                <form action="/shopsphere/cart"
                                      method="post">

                                    <input type="hidden"
                                           name="action"
                                           value="remove">

                                    <input type="hidden"
                                           name="cartId"
                                           value="${item.cartId}">

                                    <button class="remove-btn"
                                            type="submit">
                                        🗑 Remove
                                    </button>

                                </form>

                            </div>

                        </div>

                    </div>

                </c:forEach>

            </div>

            <aside class="summary">

                <h2>Order Summary</h2>

                <div class="summary-line">
                    <span>Items</span>
                    <span>${cartItems.size()}</span>
                </div>

                <div class="summary-line">
                    <span>Shipping</span>
                    <span>FREE</span>
                </div>

                <div class="summary-total">
                    <span>Total</span>
                    <span>₹${cartTotal}</span>
                </div>

                <a class="checkout"
                   href="/shopsphere/checkout">
                    Proceed to Checkout →
                </a>

                <div class="secure-note">
                    🔒 Secure checkout experience
                </div>

            </aside>

        </div>

    </c:if>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>