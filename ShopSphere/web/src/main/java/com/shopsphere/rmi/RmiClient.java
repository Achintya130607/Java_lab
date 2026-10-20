package com.shopsphere.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class RmiClient {

    public static void main(String[] args) {
        try {
            Registry registry = LocateRegistry.getRegistry("localhost", 1099);

            RemoteService service =
                    (RemoteService) registry.lookup("ShopSphereService");

            String message = service.getServiceMessage();

            System.out.println("=================================");
            System.out.println("RMI Server Response:");
            System.out.println(message);
            System.out.println("=================================");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}