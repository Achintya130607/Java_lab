package com.shopsphere.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface RemoteService extends Remote {

    String getServiceMessage() throws RemoteException;
}