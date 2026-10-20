package com.shopsphere.listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener {

    private static int activeSessions = 0;

    @Override
    public void sessionCreated(HttpSessionEvent event) {

        activeSessions++;

        System.out.println(
                "ShopSphere: Session created. Active sessions = "
                        + activeSessions
        );
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {

        activeSessions--;

        System.out.println(
                "ShopSphere: Session destroyed. Active sessions = "
                        + activeSessions
        );
    }

    public static int getActiveSessions() {
        return activeSessions;
    }
}