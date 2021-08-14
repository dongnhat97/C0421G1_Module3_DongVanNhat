package model.service.impl;

import model.bean.CustomerType;
import model.repository.ICustomerType;
import model.repository.impl.CustomerTypeImpl;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerType iCustomerType = new CustomerTypeImpl();

    @Override
    public List<CustomerType> showAll() {
        return iCustomerType.showAll();
    }
}
