package model.repository;

import model.bean.Customer;
import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> showCustomer() throws SQLException;
    String saveCustomer(Customer customer);
    Customer showId(int id);
    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);
}
