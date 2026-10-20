<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Product Details</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(99,102,241,.10), transparent 28%),
                radial-gradient(circle at 95% 15%, rgba(59,130,246,.10), transparent 25%),
                linear-gradient(135deg,#f8fbff,#eef3ff,#f9fbff);
            min-height: 100vh;
        }

        .page {
            padding: 50px 5% 70px;
        }

        .product-card {
            max-width: 1050px;
            margin: auto;
            display: grid;
            grid-template-columns: 42% 58%;
            gap: 35px;
            padding: 30px;
            border-radius: 28px;
            background: rgba(255,255,255,.90);
            border: 1px solid rgba(255,255,255,.95);
            box-shadow: 0 20px 55px rgba(30,41,59,.10);
            backdrop-filter: blur(10px);
        }

        .visual {
            min-height: 430px;
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 130px;
            background: linear-gradient(135deg,#dbeafe,#c7d2fe,#ddd6fe);
        }

        .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
            margin-bottom: 12px;
        }

        h1 {
            margin: 0 0 12px;
            font-size: 44px;
            line-height: 1.05;
        }

        .brand {
            color: #64748b;
            margin-bottom: 22px;
        }

        .description {
            color: #64748b;
            line-height: 1.65;
            font-size: 16px;
            margin-bottom: 22px;
        }

        .price {
            font-size: 34px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .discount {
            color: #16a34a;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .stock {
            display: inline-block;
            width: fit-content;
            padding: 8px 13px;
            border-radius: 999px;
            background: #ecfdf5;
            color: #15803d;
            font-weight: bold;
            margin-bottom: 22px;
        }

        .out-stock {
            display: inline-block;
            padding: 12px 15px;
            border-radius: 12px;
            background: #fef2f2;
            color: #dc2626;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .quantity {
            width: 95px;
            padding: 12px;
            border-radius: 12px;
            border: 1px solid #cbd5e1;
            margin: 8px 0 18px;
            font-size: 16px;
        }

        .btn-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn,
        .wishlist-btn {
            border: 0;
            min-height: 48px;
            padding: 13px 20px;
            border-radius: 13px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            font-size: 15px;
        }

        .btn {
            color: white;
            background: linear-gradient(135deg,#2563eb,#4f46e5);
            box-shadow: 0 10px 24px rgba(37,99,235,.22);
        }

        .wishlist-btn {
            color: #db2777;
            background: #fce7f3;
        }

        .back {
            display: inline-block;
            margin-top: 25px;
            color: #475569;
            text-decoration: none;
            font-weight: bold;
        }

        @media (max-width: 850px) {
            .product-card {
                grid-template-columns: 1fr;
            }

            .visual {
                min-height: 300px;
            }

            h1 {
                font-size: 36px;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="product-card">

        <div class="visual">
            <c:choose>
                <c:when test="${product.name.toLowerCase().contains('phone')}">📱</c:when>
                <c:when test="${product.name.toLowerCase().contains('laptop')}">💻</c:when>
                <c:when test="${product.name.toLowerCase().contains('shirt')}">👕</c:when>
                <c:when test="${product.name.toLowerCase().contains('mixer')}">🍳</c:when>
                <c:when test="${product.name.toLowerCase().contains('book')}">📚</c:when>
                <c:when test="${product.name.toLowerCase().contains('football')}">⚽</c:when>
                <c:otherwise>🛍️</c:otherwise>
            </c:choose>
        </div>

        <div class="info">

            <div class="small-title">SHOPSPHERE PRODUCT</div>

            <h1>${product.name}</h1>

            <div class="brand">
                Brand: ${product.brand}
            </div>

            <div class="description">
                ${product.description}
            </div>

            <div class="price">
                ₹${product.price}
            </div>

            <div class="discount">
                ${product.discount}% discount available
            </div>

            <c:if test="${product.stock > 0}">

                <div class="stock">
                    ✓ In Stock — ${product.stock} available
                </div>

                <form action="/shopsphere/cart" method="post">

                    <input type="hidden"
                           name="action"
                           value="add">

                    <input type="hidden"
                           name="productId"
                           value="${product.productId}">

                    <label><strong>Quantity</strong></label><br>

                    <input class="quantity"
                           type="number"
                           name="quantity"
                           value="1"
                           min="1"
                           max="${product.stock}"
                           required>

                    <div class="btn-row">

                        <button class="btn"
                                type="submit">
                            🛒 Add to Cart
                        </button>

                    </div>

                </form>

                <form action="/shopsphere/wishlist"
                      method="post"
                      style="margin-top:12px;">

                    <input type="hidden"
                           name="productId"
                           value="${product.productId}">

                    <button class="wishlist-btn"
                            type="submit">
                        ❤️ Add to Wishlist
                    </button>

                </form>

            </c:if>

            <c:if test="${product.stock == 0}">
                <div class="out-stock">
                    ✕ Out of Stock
                </div>
            </c:if>

            <a class="back"
               href="/shopsphere/products">
                ← Back to Products
            </a>

        </div>

    </div>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>