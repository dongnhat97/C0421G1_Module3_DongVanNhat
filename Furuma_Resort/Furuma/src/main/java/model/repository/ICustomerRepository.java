package model.repository;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> showCustomer() throws SQLException;
}
