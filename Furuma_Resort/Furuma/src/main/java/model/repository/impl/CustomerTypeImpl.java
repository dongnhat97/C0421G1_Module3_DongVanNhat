package model.repository.impl;

import model.bean.CustomerType;
import model.repository.ICustomerType;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeImpl implements ICustomerType {
   BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<CustomerType> showAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        CustomerType customerType = null;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select*\n" +
                    "from customer_type;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                customerType = new CustomerType();
                customerType.setCustomerTypeID(resultSet.getInt("customer_type_id"));
                customerType.setCustomerTypeName(resultSet.getString("customer_type_name"));
                customerTypeList.add(customerType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }
}
