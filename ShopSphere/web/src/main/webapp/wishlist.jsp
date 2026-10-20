<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Wishlist</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(244, 114, 182, 0.10), transparent 28%),
                radial-gradient(circle at 95% 10%, rgba(59, 130, 246, 0.10), transparent 26%),
                linear-gradient(135deg, #fff8fc, #f3f6ff, #f9fbff);
            min-height: 100vh;
        }

        .page {
            padding: 42px 5% 70px;
        }

        .page-header {
            max-width: 1200px;
            margin: 0 auto 38px;
            text-align: center;
        }

        .small-title {
            display: inline-block;
            color: #db2777;
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
            margin: 12px auto 0;
            max-width: 650px;
            color: #64748b;
            font-size: 17px;
        }

        .wishlist-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 24px;
        }

        .wishlist-item {
            position: relative;
            overflow: hidden;
            padding: 18px;
            border-radius: 24px;
            background: rgba(255, 255, 255, 0.90);
            border: 1px solid rgba(255,255,255,0.95);
            box-shadow: 0 18px 45px rgba(30,41,59,0.08);
            backdrop-filter: blur(10px);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .wishlist-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 24px 55px rgba(30,41,59,0.13);
        }

        .wishlist-top {
            height: 170px;
            border-radius: 18px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 65px;
            background: linear-gradient(135deg, #fce7f3, #ddd6fe);
        }

        .wishlist-item:nth-child(2) .wishlist-top {
            background: linear-gradient(135deg, #dbeafe, #e0e7ff);
        }

        .wishlist-item:nth-child(3) .wishlist-top {
            background: linear-gradient(135deg, #dcfce7, #d1fae5);
        }

        .wishlist-item:nth-child(4) .wishlist-top {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
        }

        .heart-badge {
            position: absolute;
            top: 28px;
            right: 28px;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255,255,255,0.90);
            font-size: 20px;
            box-shadow: 0 8px 20px rgba(30,41,59,0.10);
        }

        .wishlist-item h2 {
            margin: 0 0 8px;
            font-size: 24px;
        }

        .brand {
            margin-bottom: 14px;
            color: #64748b;
            font-size: 14px;
        }

        .description {
            min-height: 58px;
            margin-bottom: 18px;
            color: #64748b;
            line-height: 1.5;
            font-size: 14px;
        }

        .product-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 9px;
            margin-bottom: 18px;
        }

        .meta-pill {
            padding: 7px 10px;
            border-radius: 10px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #475569;
            font-size: 13px;
        }

        .price {
            margin-bottom: 5px;
            font-size: 25px;
            font-weight: 800;
            color: #111827;
        }

        .save {
            margin-bottom: 18px;
            color: #16a34a;
            font-size: 13px;
            font-weight: bold;
        }

        .stock {
            color: #475569;
            font-size: 14px;
            font-weight: bold;
        }

        .empty {
            max-width: 700px;
            margin: 75px auto;
            padding: 60px 30px;
            text-align: center;
            border-radius: 28px;
            background: rgba(255,255,255,0.90);
            border: 1px solid rgba(255,255,255,0.95);
            box-shadow: 0 20px 50px rgba(30,41,59,0.10);
            backdrop-filter: blur(10px);
        }

        .empty-icon {
            width: 92px;
            height: 92px;
            margin: 0 auto 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            background: #fce7f3;
        }

        .empty h2 {
            margin: 0 0 10px;
            font-size: 29px;
        }

        .empty p {
            color: #64748b;
            margin-bottom: 24px;
        }

        .shop-btn {
            display: inline-block;
            padding: 13px 22px;
            border-radius: 13px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: linear-gradient(135deg, #db2777, #7c3aed);
            box-shadow: 0 10px 24px rgba(219,39,119,0.24);
        }

        .shop-btn:hover {
            transform: translateY(-2px);
        }

        @media (max-width: 1050px) {
            .wishlist-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 650px) {
            .page {
                padding: 30px 16px 50px;
            }

            .page-header h1 {
                font-size: 33px;
            }

            .wishlist-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<div class="page">

    <div class="page-header">

        <div class="small-title">
            YOUR SAVED ITEMS
        </div>

        <h1>My Wishlist ❤️</h1>

        <p>
            Keep your favourite products saved and find them whenever you are ready to shop.
        </p>

    </div>

    <c:if test="${empty wishlistItems}">

        <div class="empty">

            <div class="empty-icon">
                ❤️
            </div>

            <h2>Your wishlist is empty</h2>

            <p>
                Save products you love and come back to them later.
            </p>

            <a class="shop-btn"
               href="/shopsphere/products">
                🛍️ Explore Products
            </a>

        </div>

    </c:if>

    <c:if test="${not empty wishlistItems}">

        <div class="wishlist-grid">

            <c:forEach var="item"
                       items="${wishlistItems}">

                <div class="wishlist-item">

                    <div class="heart-badge">
                        ❤️
                    </div>

                    <div class="wishlist-top">

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

                    <h2>
                        ${item.product.name}
                    </h2>

                    <div class="brand">
                        Brand: ${item.product.brand}
                    </div>

                    <div class="description">
                        ${item.product.description}
                    </div>

                    <div class="product-meta">

                        <div class="meta-pill">
                            Stock: ${item.product.stock}
                        </div>

                        <div class="meta-pill">
                            Discount: ${item.product.discount}%
                        </div>

                    </div>

                    <div class="price">
                        ₹${item.product.price}
                    </div>

                    <div class="save">
                        ${item.product.discount}% discount available
                    </div>

                    <div class="stock">
                        ${item.product.stock > 0 ? '✓ In Stock' : '✕ Out of Stock'}
                    </div>

                </div>

            </c:forEach>

        </div>

    </c:if>

</div>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>