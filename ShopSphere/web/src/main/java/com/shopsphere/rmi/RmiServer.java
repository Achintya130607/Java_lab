package com.shopsphere.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class RmiServer {

    public static void main(String[] args) {
        try {
            RemoteService service = new RemoteServiceImpl();

            Registry registry = LocateRegistry.createRegistry(1099);

            registry.rebind("ShopSphereService", service);

            System.out.println("=================================");
            System.out.println("ShopSphere RMI Server Started");
            System.out.println("RMI Registry Port: 1099");
            System.out.println("Service Name: ShopSphereService");
            System.out.println("=================================");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}