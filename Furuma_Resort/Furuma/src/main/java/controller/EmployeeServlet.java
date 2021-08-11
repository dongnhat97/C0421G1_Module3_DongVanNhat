package controller;

import model.bean.Employee;
import model.service.IEmployeeService;
import model.service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_employee":
                createEmployee(request,response);
                break;
            case "update_employee":
//                updateEmployee(request,response);
                break;
            case "delete":
                break;
            case "employee_list":
                showEmployee(request,response);
                break;
            case "searchId":
                break;
            case "customer_employee":
//                showCustomer(request,response);
                break;

        }
    }
    private void createEmployee (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Employee employee  = new Employee();
         String name = request.getParameter("name");
         String birthday = request.getParameter("birthday");
         String car = request.getParameter("car");
         double salary = Double.parseDouble(request.getParameter("Salary"));
         String phone = request.getParameter("Phone");
         String email = request.getParameter("Email");
         String address = request.getParameter("Address");
         int position = Integer.parseInt(request.getParameter("Position"));
         int education  = Integer.parseInt(request.getParameter("Education"));
         int division = Integer.parseInt(request.getParameter("Division"));
         String user = request.getParameter("UserName");
         employee.setEmployeeName(name);
         employee.setEmployeeBirthday(birthday);
         employee.setEmployeeIdCar(car);
         employee.setEmployeeSalary(salary);
         employee.setEmployeePhone(phone);
         employee.setEmployeeEmail(email);
         employee.setEmployeeAddress(address);
         employee.setPositionId(position);
         employee.setEducationDegreeId(education);
         employee.setDivisionId(division);

         if ("true".equals(iEmployeeService.saveEmployee(employee))) {
             request.setAttribute("message","Thêm mới thành công");
             try {
                 request.setAttribute("employeeList",iEmployeeService.showEmployee());
             } catch (SQLException throwables) {
                 throwables.printStackTrace();
             }
             request.getRequestDispatcher("employee/selectAll.jsp").forward(request,response);
         }else {
             request.setAttribute("message","Thêm mới không thành công");
             request.getRequestDispatcher("create.jsp").forward(request,response);
         }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_employee":
                showCreate(request,response);
                break;
            case "update_employee":
//                showUpdate(request,response);
                break;
            case "delete":
                break;
            case "employee_list":
                showEmployee(request,response);
                break;
            case "searchId":
                break;
            case "customer_employee":
//                showCustomer(request,response);
                break;

        }
    }
    private void showEmployee (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("employeeList",iEmployeeService.showEmployee());
            request.getRequestDispatcher("employee/selectAll.jsp").forward(request,response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    private void showCreate (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("employee/create.jsp").forward(request,response);
    }
    private void showUpdate (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("employeeID",iEmployeeService.showId(id));
        request.getRequestDispatcher("employee/update.jsp").forward(request,response);
    }
}
