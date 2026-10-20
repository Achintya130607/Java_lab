<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ShopSphere - Reviews</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        .review-form,
        .review-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        button {
            padding: 10px 18px;
            cursor: pointer;
        }

        .rating {
            font-weight: bold;
        }

        .empty {
            text-align: center;
            color: #777;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Product Reviews</h1>

    <div class="review-form">

        <h2>Write a Review</h2>

        <form action="review" method="post">

            <input type="hidden"
                   name="productId"
                   value="${productId}">

            <label>Rating</label>

            <select name="rating" required>
                <option value="">Select Rating</option>
                <option value="5">5 - Excellent</option>
                <option value="4">4 - Very Good</option>
                <option value="3">3 - Good</option>
                <option value="2">2 - Average</option>
                <option value="1">1 - Poor</option>
            </select>

            <label>Review</label>

            <textarea
                name="reviewText"
                placeholder="Write your review..."
                required></textarea>

            <button type="submit">
                Submit Review
            </button>

        </form>

    </div>

    <h2>Customer Reviews</h2>

    <c:if test="${empty reviews}">
        <p class="empty">No reviews yet.</p>
    </c:if>

    <c:forEach var="review" items="${reviews}">

        <div class="review-card">

            <p class="rating">
                Rating: ${review.rating}/5
            </p>

            <p>
                ${review.reviewText}
            </p>

            <p>
                <strong>Date:</strong>
                ${review.createdAt}
            </p>

        </div>

    </c:forEach>

</div>

</body>
</html>