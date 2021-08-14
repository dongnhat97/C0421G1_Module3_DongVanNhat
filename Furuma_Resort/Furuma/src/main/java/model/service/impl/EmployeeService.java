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
    public Employee showId(int id) {
        return iEmployeeRepository.showId(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return iEmployeeRepository.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return iEmployeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> showName(String name) {
        return iEmployeeRepository.showName(name);
    }
}
