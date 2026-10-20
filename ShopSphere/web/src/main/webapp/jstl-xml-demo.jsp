<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopSphere - JSTL XML Demo</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f4f4f4;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        .product {
            border: 1px solid #ddd;
            padding: 15px;
            margin: 12px 0;
            border-radius: 8px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>ShopSphere JSTL XML Demonstration</h1>

    <c:import
            url="/data/products.xml"
            var="xmlText" />

    <x:parse
            xml="${xmlText}"
            var="productXml" />

    <h2>Products from XML</h2>

    <x:forEach
            select="$productXml/products/product"
            var="product">

        <div class="product">

            <h3>
                <x:out select="$product/name" />
            </h3>

            <p>
                <strong>ID:</strong>
                <x:out select="$product/id" />
            </p>

            <p>
                <strong>Price:</strong>
                ₹<x:out select="$product/price" />
            </p>

            <p>
                <strong>Stock:</strong>
                <x:out select="$product/stock" />
            </p>

        </div>

    </x:forEach>

</div>

</body>
</html>