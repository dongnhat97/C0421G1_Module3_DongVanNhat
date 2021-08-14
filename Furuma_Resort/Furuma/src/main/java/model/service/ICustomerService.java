package model.service;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> showCustomer() throws SQLException;
    String saveCustomer(Customer customer);
    Customer showId(int id);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
}
