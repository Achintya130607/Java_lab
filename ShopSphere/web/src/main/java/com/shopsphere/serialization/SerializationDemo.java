package com.shopsphere.serialization;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializationDemo {

    public static void main(String[] args) {

        String fileName = "product.ser";

        SerializedProduct product =
                new SerializedProduct(101, "Smartphone X1", 29999.0);

        // Serialization
        try (ObjectOutputStream out =
                     new ObjectOutputStream(new FileOutputStream(fileName))) {

            out.writeObject(product);

            System.out.println("=================================");
            System.out.println("Serialization Successful");
            System.out.println("Saved Object:");
            System.out.println(product);
            System.out.println("=================================");

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Deserialization
        try (ObjectInputStream in =
                     new ObjectInputStream(new FileInputStream(fileName))) {

            SerializedProduct restoredProduct =
                    (SerializedProduct) in.readObject();

            System.out.println("=================================");
            System.out.println("Deserialization Successful");
            System.out.println("Restored Object:");
            System.out.println(restoredProduct);
            System.out.println("=================================");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}