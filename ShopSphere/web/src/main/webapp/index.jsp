<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Home</title>

    <style>
        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #111827;
            background:
                radial-gradient(circle at 10% 20%, rgba(99, 102, 241, 0.18), transparent 30%),
                radial-gradient(circle at 90% 10%, rgba(59, 130, 246, 0.18), transparent 28%),
                linear-gradient(135deg, #f8fbff 0%, #eef2ff 45%, #f9fbff 100%);
            min-height: 100vh;
        }

        .hero {
            position: relative;
            overflow: hidden;
            padding: 85px 7% 65px;
            min-height: 570px;
            display: flex;
            align-items: center;
        }

        .hero::before,
        .hero::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            filter: blur(2px);
            pointer-events: none;
        }

        .hero::before {
            width: 320px;
            height: 320px;
            background: rgba(96, 165, 250, 0.15);
            top: -90px;
            left: -100px;
        }

        .hero::after {
            width: 360px;
            height: 360px;
            background: rgba(129, 140, 248, 0.14);
            right: -120px;
            bottom: -150px;
        }

        .hero-content {
            width: 52%;
            position: relative;
            z-index: 2;
        }

        .welcome-line {
            display: flex;
            align-items: center;
            gap: 14px;
            color: #4f46e5;
            font-weight: bold;
            letter-spacing: 5px;
            font-size: 14px;
            margin-bottom: 14px;
        }

        .welcome-line span {
            width: 52px;
            height: 5px;
            border-radius: 20px;
            background: linear-gradient(90deg, #2563eb, #7c3aed);
        }

        .hero h1 {
            font-size: clamp(48px, 6vw, 82px);
            line-height: 0.95;
            margin: 0;
            font-weight: 800;
            letter-spacing: -4px;
        }

        .hero h1 .blue {
            color: #2563eb;
        }

        .hero p {
            margin: 24px 0 30px;
            font-size: 21px;
            color: #475569;
            max-width: 650px;
            line-height: 1.5;
        }

        .hero-buttons {
            display: flex;
            gap: 18px;
            flex-wrap: wrap;
        }

        .hero-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            min-width: 205px;
            padding: 16px 24px;
            border-radius: 16px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.25s ease;
        }

        .hero-button.primary {
            color: white;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            box-shadow: 0 14px 30px rgba(37, 99, 235, 0.28);
        }

        .hero-button.secondary {
            color: #1e293b;
            background: rgba(255, 255, 255, 0.72);
            border: 2px solid rgba(99, 102, 241, 0.25);
        }

        .hero-button:hover {
            transform: translateY(-3px);
        }

        .hero-button.primary:hover {
            box-shadow: 0 18px 38px rgba(37, 99, 235, 0.35);
        }

        .hero-visual {
            width: 48%;
            min-height: 450px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .visual-glow {
            width: 420px;
            height: 420px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(96, 165, 250, 0.35), rgba(129, 140, 248, 0.08), transparent 70%);
            position: absolute;
        }

        .cart-platform {
            width: 380px;
            height: 95px;
            position: absolute;
            bottom: 65px;
            border-radius: 50%;
            background: linear-gradient(180deg, #dbeafe, #818cf8);
            box-shadow: 0 25px 50px rgba(79, 70, 229, 0.20);
        }

        .shopping-cart {
            position: relative;
            z-index: 2;
            font-size: 160px;
            filter: drop-shadow(0 18px 20px rgba(30, 64, 175, 0.18));
            transform: rotate(-3deg);
        }

        .floating-card {
            position: absolute;
            padding: 14px 18px;
            border-radius: 18px;
            background: rgba(255, 255, 255, 0.80);
            border: 1px solid rgba(255, 255, 255, 0.9);
            box-shadow: 0 16px 35px rgba(30, 41, 59, 0.10);
            backdrop-filter: blur(8px);
            font-size: 26px;
        }

        .discount-card {
            top: 55px;
            left: 30px;
        }

        .bag-card {
            top: 120px;
            right: 10px;
        }

        .heart-card {
            bottom: 135px;
            left: 65px;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            max-width: 1250px;
            margin: -5px auto 70px;
            padding: 0 30px;
            position: relative;
            z-index: 5;
        }

        .feature {
            position: relative;
            padding: 35px 24px;
            min-height: 200px;
            text-align: center;
            border-radius: 24px;
            background: rgba(255, 255, 255, 0.80);
            border: 1px solid rgba(255, 255, 255, 0.95);
            box-shadow: 0 18px 45px rgba(30, 41, 59, 0.08);
            backdrop-filter: blur(10px);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .feature:hover {
            transform: translateY(-8px);
            box-shadow: 0 22px 55px rgba(30, 41, 59, 0.13);
        }

        .feature-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin: 0 auto 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 31px;
        }

        .feature.products .feature-icon {
            background: #dbeafe;
        }

        .feature.cart .feature-icon {
            background: #dcfce7;
        }

        .feature.wishlist .feature-icon {
            background: #fce7f3;
        }

        .feature.orders .feature-icon {
            background: #fef3c7;
        }

        .feature h2 {
            margin: 0 0 10px;
            font-size: 25px;
        }

        .feature p {
            margin: 0;
            color: #475569;
            font-size: 16px;
            line-height: 1.5;
        }

        .feature-link {
            display: block;
            color: inherit;
            text-decoration: none;
            height: 100%;
        }

        @media (max-width: 1000px) {
            .hero {
                padding: 65px 5%;
            }

            .hero-content,
            .hero-visual {
                width: 50%;
            }

            .features {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 760px) {
            .hero {
                flex-direction: column;
                padding: 55px 25px 35px;
                text-align: center;
            }

            .hero-content,
            .hero-visual {
                width: 100%;
            }

            .welcome-line {
                justify-content: center;
            }

            .hero-buttons {
                justify-content: center;
            }

            .hero-visual {
                min-height: 360px;
                margin-top: 20px;
            }

            .shopping-cart {
                font-size: 125px;
            }

            .cart-platform {
                width: 290px;
                height: 75px;
                bottom: 45px;
            }

            .floating-card {
                font-size: 20px;
            }

            .features {
                grid-template-columns: 1fr;
                padding: 0 20px;
            }
        }
    </style>
</head>

<body>

<jsp:include page="fragments/navbar.jspf" />

<section class="hero">

    <div class="hero-content">

        <div class="welcome-line">
            <span></span>
            WELCOME TO
        </div>

        <h1>
            Shop<span class="blue">Sphere</span>
        </h1>

        <p>
            Your simple Java-based E-Commerce Store
        </p>

        <div class="hero-buttons">

            <a class="hero-button primary"
               href="/shopsphere/products">
                🛒 Browse Products →
            </a>

            <a class="hero-button secondary"
               href="/shopsphere/register">
                👤 Create Account →
            </a>

        </div>

    </div>

    <div class="hero-visual">

        <div class="visual-glow"></div>

        <div class="floating-card discount-card">
            %
        </div>

        <div class="floating-card bag-card">
            🛍️
        </div>

        <div class="floating-card heart-card">
            💙
        </div>

        <div class="shopping-cart">
            🛒
        </div>

        <div class="cart-platform"></div>

    </div>

</section>

<section class="features">

    <a href="/shopsphere/products" class="feature-link">
        <div class="feature products">

            <div class="feature-icon">
                🛍️
            </div>

            <h2>Products</h2>

            <p>
                Browse available products.
            </p>

        </div>
    </a>

    <a href="/shopsphere/cart" class="feature-link">
        <div class="feature cart">

            <div class="feature-icon">
                🛒
            </div>

            <h2>Cart</h2>

            <p>
                Add products to your shopping cart.
            </p>

        </div>
    </a>

    <a href="/shopsphere/wishlist" class="feature-link">
        <div class="feature wishlist">

            <div class="feature-icon">
                ❤️
            </div>

            <h2>Wishlist</h2>

            <p>
                Save products for later.
            </p>

        </div>
    </a>

    <a href="/shopsphere/orders" class="feature-link">
        <div class="feature orders">

            <div class="feature-icon">
                📦
            </div>

            <h2>Orders</h2>

            <p>
                Place and track your orders.
            </p>

        </div>
    </a>

</section>

<jsp:include page="fragments/footer.jspf" />

</body>
</html>