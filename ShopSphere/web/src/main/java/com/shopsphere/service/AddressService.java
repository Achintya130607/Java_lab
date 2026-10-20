package com.shopsphere.service;

import com.shopsphere.dao.AddressDAO;
import com.shopsphere.model.Address;

public class AddressService {

    private AddressDAO addressDAO;

    public AddressService() {
        addressDAO = new AddressDAO();
    }

    public int addAddress(Address address) {
        return addressDAO.addAddress(address);
    }
}