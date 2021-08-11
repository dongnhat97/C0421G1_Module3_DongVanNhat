package model.repository.impl;

import model.bean.Customer;
import model.repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Customer> showCustomer() throws SQLException {
        Customer customer = null;
        List<Customer> customerList = new ArrayList<>();
        PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" select *\n" +
                " from Customer");
       ResultSet resultSet = preparedStatement.executeQuery();
       while (resultSet.next()) {
             customer = new Customer();
             customer.setCustomerId(resultSet.getInt("customer_id"));
             customer.setCustomerCode(resultSet.getString("customer_code"));
             customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
             customer.setCustomerName(resultSet.getString("customer_name"));
             customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
             customer.setCustomerGender(resultSet.getInt("customer_gender"));
             customer.setCustomerIdCar(resultSet.getString("customer_id_car"));
             customer.setCustomerPhone(resultSet.getString("customer_phone"));
             customer.setCustomerEmail(resultSet.getString("customer_email"));
             customer.setCustomerAddress(resultSet.getString("customer_address"));
             customerList.add(customer);
       }
        return customerList;
    }
}
