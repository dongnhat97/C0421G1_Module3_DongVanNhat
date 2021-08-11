package model.repository.impl;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeRepository  implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Employee> showEmployee() throws SQLException {
        Employee employee = null;
        List<Employee> employeeList = new ArrayList<>();
        PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" select * \n" +
                " from employee;");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            employee = new Employee();
            employee.setEmployeeId(resultSet.getInt("employee_id"));
            employee.setEmployeeName(resultSet.getString("employee_name"));
            employee.setEmployeeBirthday(resultSet.getString("employee_birthday"));
            employee.setEmployeeIdCar(resultSet.getString("employee_id_car"));
            employee.setEmployeeSalary(resultSet.getDouble("employee_salary"));
            employee.setEmployeePhone(resultSet.getString("employee_phone"));
            employee.setEmployeeEmail(resultSet.getString("employee_email"));
            employee.setEmployeeAddress(resultSet.getString("employee_address"));
            employee.setPositionId(resultSet.getInt("position_id"));
            employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
            employee.setUserName(resultSet.getString("user_name"));
            employeeList.add(employee);
        }
        return employeeList;
    }

    @Override
    public String saveEmployee(Employee employee) {
        int row =0;
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("insert into employee (employee_name,employee_birthday,employee_id_car," +
                    "employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,user_name)\n" +
                    " value(?,?,?,?,?,?,?,?,?,?,?)");
            System.out.println(preparedStatement);
            preparedStatement.setString(1,employee.getEmployeeName());
            preparedStatement.setString(2,employee.getEmployeeBirthday());
            preparedStatement.setString(3,employee.getEmployeeIdCar());
            preparedStatement.setDouble(4,employee.getEmployeeSalary());
            preparedStatement.setString(5,employee.getEmployeePhone());
            preparedStatement.setString(6,employee.getEmployeeEmail());
            preparedStatement.setString(7,employee.getEmployeeAddress());
            preparedStatement.setInt(8,employee.getPositionId());
            preparedStatement.setInt(9,employee.getEducationDegreeId());
            preparedStatement.setInt(10,employee.getDivisionId());
            preparedStatement.setString(11,employee.getUserName());

            row = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return row>0?"true":"Thêm mới thất bại";
    }

    @Override
//    Show ID
    public Employee showId(int id) {
        Employee employee = new Employee();
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(" select*\n" +
                    " from employee\n" +
                    " where employee_id =?");
            preparedStatement.setString(1,id+"");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                employee.setEmployeeId(id);
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setEmployeeBirthday(resultSet.getString("employee_birthday"));
                employee.setEmployeeIdCar(resultSet.getString("employee_id_car"));
                employee.setEmployeeSalary(resultSet.getDouble("employee_salary"));
                employee.setEmployeePhone(resultSet.getString("employee_phone"));
                employee.setEmployeeEmail(resultSet.getString("employee_email"));
                employee.setEmployeeAddress(resultSet.getString("employee_address"));
                employee.setPositionId(resultSet.getInt("position_id"));
                employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                employee.setUserName(resultSet.getString("user_name"));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return false;
    }
}
