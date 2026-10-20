package com.shopsphere.socket;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class SocketClient {

    public static void main(String[] args) {

        String host = "localhost";
        int port = 5000;

        try (Socket socket = new Socket(host, port);
             BufferedReader in = new BufferedReader(
                     new InputStreamReader(socket.getInputStream()));
             PrintWriter out = new PrintWriter(
                     socket.getOutputStream(), true)) {

            System.out.println("Connected to ShopSphere Socket Server.");

            out.println("Hello from ShopSphere Socket Client!");

            String serverMessage = in.readLine();

            System.out.println("Server Response: " + serverMessage);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}