package com.shopsphere.swing.network;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class UrlConnectionDemo {

    public static void main(String[] args) {

        String urlString = "http://localhost:8080/shopsphere/";

        try {
            URL url = new URL(urlString);
            URLConnection connection = url.openConnection();

            System.out.println("=================================");
            System.out.println("URL / URLConnection Demo");
            System.out.println("URL: " + url);
            System.out.println("Protocol: " + url.getProtocol());
            System.out.println("Host: " + url.getHost());
            System.out.println("Port: " + url.getPort());
            System.out.println("Content Type: " + connection.getContentType());
            System.out.println("=================================");

            try (BufferedReader reader =
                         new BufferedReader(
                                 new InputStreamReader(
                                         connection.getInputStream()))) {

                String line;
                int count = 0;

                while ((line = reader.readLine()) != null && count < 5) {
                    System.out.println(line);
                    count++;
                }
            }

            System.out.println("=================================");
            System.out.println("URLConnection completed successfully.");
            System.out.println("=================================");

        } catch (Exception e) {
            System.out.println("URLConnection demo could not connect.");
            System.out.println("Reason: " + e.getMessage());
        }
    }
}