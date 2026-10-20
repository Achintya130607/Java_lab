package com.shopsphere.service;

import com.shopsphere.dao.ReviewDAO;
import com.shopsphere.model.Review;

import java.util.List;

public class ReviewService {

    private ReviewDAO reviewDAO;

    public ReviewService() {
        reviewDAO = new ReviewDAO();
    }

    public boolean addReview(Review review) {
        return reviewDAO.addReview(review);
    }

    public List<Review> getReviewsByProduct(int productId) {
        return reviewDAO.getReviewsByProduct(productId);
    }
}