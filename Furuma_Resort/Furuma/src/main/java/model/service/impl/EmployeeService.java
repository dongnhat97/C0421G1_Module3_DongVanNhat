package model.service.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.IEmployeeRepository;
import model.repository.impl.EmployeRepository;
import model.service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository iEmployeeRepository = new EmployeRepository();
    @Override
    public List<Employee> showEmployee() throws SQLException {
        return iEmployeeRepository.showEmployee();
    }

    @Override
    public String saveEmployee(Employee employee) {
        return iEmployeeRepository.saveEmployee(employee);
    }

    @Override
    public Customer showId(int id) {
        return null;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return false;
    }
}
