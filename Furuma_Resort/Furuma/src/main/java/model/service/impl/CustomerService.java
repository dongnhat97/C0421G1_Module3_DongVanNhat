package model.service.impl;

import model.bean.Customer;
import model.repository.ICustomerRepository;
import model.repository.impl.CustomerRepository;
import model.service.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    @Override
    public List<Customer> showCustomer() throws SQLException {
        return iCustomerRepository.showCustomer();
    }

    @Override
    public String saveCustomer(Customer customer) {
        return iCustomerRepository.saveCustomer(customer);
    }

    @Override
    public Customer showId(int id) {
        return iCustomerRepository.showId(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return iCustomerRepository.updateCustomer(customer);
    }
}
