package com.shopsphere.swing.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

public class I18nDemo {

    public static void main(String[] args) {

        Locale englishLocale = Locale.ENGLISH;
        Locale hindiLocale = new Locale("hi", "IN");

        ResourceBundle englishBundle =
                ResourceBundle.getBundle("messages", englishLocale);

        ResourceBundle hindiBundle =
                ResourceBundle.getBundle("messages", hindiLocale);

        System.out.println("=================================");
        System.out.println("English:");
        System.out.println("Title: " + englishBundle.getString("app.title"));
        System.out.println("Welcome: " + englishBundle.getString("app.welcome"));
        System.out.println("Products: " + englishBundle.getString("app.products"));

        System.out.println("=================================");
        System.out.println("Hindi:");
        System.out.println("Title: " + hindiBundle.getString("app.title"));
        System.out.println("Welcome: " + hindiBundle.getString("app.welcome"));
        System.out.println("Products: " + hindiBundle.getString("app.products"));
        System.out.println("=================================");
    }
}