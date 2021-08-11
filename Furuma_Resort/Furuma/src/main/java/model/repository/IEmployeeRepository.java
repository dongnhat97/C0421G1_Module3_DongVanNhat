package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showEmployee() throws SQLException;
    String saveEmployee(Employee employee);
    Employee showId(int id);
    boolean updateEmployee(Employee employee);
}
