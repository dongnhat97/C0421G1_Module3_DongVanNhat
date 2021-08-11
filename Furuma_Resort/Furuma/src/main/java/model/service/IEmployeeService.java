package model.service;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> showEmployee() throws SQLException;
    String saveEmployee(Employee employee);
    Customer showId(int id);
    boolean updateEmployee(Employee employee);
}
