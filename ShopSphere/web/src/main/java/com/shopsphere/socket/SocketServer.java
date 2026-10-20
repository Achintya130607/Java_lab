package com.shopsphere.socket;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketServer {

    public static void main(String[] args) {

        int port = 5000;

        try (ServerSocket serverSocket = new ServerSocket(port)) {

            System.out.println("=================================");
            System.out.println("ShopSphere Socket Server Started");
            System.out.println("Server Port: " + port);
            System.out.println("Waiting for client...");
            System.out.println("=================================");

            try (Socket socket = serverSocket.accept();
                 BufferedReader in = new BufferedReader(
                         new InputStreamReader(socket.getInputStream()));
                 PrintWriter out = new PrintWriter(
                         socket.getOutputStream(), true)) {

                System.out.println("Client connected!");

                String clientMessage = in.readLine();

                System.out.println("Client Message: " + clientMessage);

                out.println("Hello from ShopSphere Socket Server!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}