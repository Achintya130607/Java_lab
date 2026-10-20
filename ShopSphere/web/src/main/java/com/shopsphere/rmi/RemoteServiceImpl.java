package com.shopsphere.rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class RemoteServiceImpl extends UnicastRemoteObject implements RemoteService {

    public RemoteServiceImpl() throws RemoteException {
        super();
    }

    @Override
    public String getServiceMessage() throws RemoteException {
        return "ShopSphere RMI Service is running successfully!";
    }
}