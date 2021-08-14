package model.repository.impl;

import model.bean.Customer;
import model.bean.User;
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

    @Override
    public String saveCustomer(Customer customer) {
        int row =0;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("insert into Customer (customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_car,customer_phone,customer_email,customer_address) \n" +
                    " value(?,?,?,?,?,?,?,?,?);");
            System.out.println(preparedStatement);
            preparedStatement.setString(1,customer.getCustomerCode());
            preparedStatement.setInt(2,customer.getCustomerTypeId());
            preparedStatement.setString(3,customer.getCustomerName());
            preparedStatement.setString(4,customer.getCustomerBirthday());
            preparedStatement.setInt(5,customer.getCustomerGender());
            preparedStatement.setString(6,customer.getCustomerIdCar());
            preparedStatement.setString(7,customer.getCustomerPhone());
            preparedStatement.setString(8,customer.getCustomerEmail());
            preparedStatement.setString(9,customer.getCustomerAddress());

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0?"true":"Thêm mới thất bại";
    }

    @Override
    public Customer showId(int id) {
        Customer customer = new Customer();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" select*\n" +
                    " from customer\n" +
                    " where customer_id = ?");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                customer.setCustomerId(id);
                customer.setCustomerCode(resultSet.getString("customer_code"));
                customer.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customer.setCustomerName(resultSet.getString("customer_name"));
                customer.setCustomerBirthday(resultSet.getString("customer_birthday"));
                customer.setCustomerGender(resultSet.getInt("customer_gender"));
                customer.setCustomerIdCar(resultSet.getString("customer_id_car"));
                customer.setCustomerPhone(resultSet.getString("customer_phone"));
                customer.setCustomerEmail(resultSet.getString("customer_email"));
                customer.setCustomerAddress(resultSet.getString("customer_address"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        int row =0;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("update customer\n" +
                    " set customer_code = ?, customer_type_id = ?, customer_name =?, customer_birthday = ?, customer_gender=?,customer_id_car=?, customer_phone =?,customer_email=?,customer_address=?\n" +
                    "where customer_id = ?;");
            System.out.println(preparedStatement);
            preparedStatement.setString(1,customer.getCustomerCode());
            preparedStatement.setInt(2,customer.getCustomerTypeId());
            preparedStatement.setString(3,customer.getCustomerName());
            preparedStatement.setString(4,customer.getCustomerBirthday());
            preparedStatement.setInt(5,customer.getCustomerGender());
            preparedStatement.setString(6,customer.getCustomerIdCar());
            preparedStatement.setString(7,customer.getCustomerPhone());
            preparedStatement.setString(8,customer.getCustomerEmail());
            preparedStatement.setString(9,customer.getCustomerAddress());
            preparedStatement.setInt(10,customer.getCustomerId());

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    }

    @Override
    public boolean deleteCustomer(int id) {
        int row = 0;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("delete\n" +
                    "from customer\n" +
                    "where customer_id =?;");
            preparedStatement.setString(1,id+"");
            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0;
    }
}
