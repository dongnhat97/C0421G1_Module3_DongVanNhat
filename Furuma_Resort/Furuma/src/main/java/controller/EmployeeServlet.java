package controller;

import model.bean.Employee;
import model.service.IEmployeeService;
import model.service.IPositionService;
import model.service.impl.EmployeeService;
import model.service.impl.PositionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IPositionService iPositionService = new PositionService();
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
                updateEmployee(request,response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            case "employee_list":
                showEmployee(request,response);
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
         employee.setUserName(user);

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
             request.getRequestDispatcher("employee/create.jsp").forward(request,response);
         }
    }
    private void updateEmployee (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.showId(id);
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String car = request.getParameter("car");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int education = Integer.parseInt(request.getParameter("education"));
        int division = Integer.parseInt(request.getParameter("division"));
        String user = request.getParameter("user");

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
        employee.setUserName(user);

        if (iEmployeeService.updateEmployee(employee)) {
            request.setAttribute("message","Cập nhật thành công");
            try {
                request.setAttribute("employeeList",iEmployeeService.showEmployee());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            request.getRequestDispatcher("employee/selectAll.jsp").forward(request,response);
        }else {
            request.setAttribute("message","cập nhật không thành công");
            request.getRequestDispatcher("employee/update.jsp");
        }
    }
    private void deleteEmployee (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (iEmployeeService.deleteEmployee(id)) {
            request.setAttribute("message","Đã xóa thành công");
            try {
                request.setAttribute("employeeList",iEmployeeService.showEmployee());
                request.getRequestDispatcher("employee/selectAll.jsp").forward(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
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
                showUpdate(request,response);
                break;
            case "delete":
                break;
            case "employee_list":
                showEmployee(request,response);
                break;
            case "employee_name":
            showEmployeeName(request,response);
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
        request.setAttribute("positionList",iPositionService.showPosition());
        request.getRequestDispatcher("employee/create.jsp").forward(request,response);
    }
    private void showUpdate (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee =iEmployeeService.showId(id);
        request.setAttribute("employeeID",employee);
        request.getRequestDispatcher("employee/update.jsp").forward(request,response);
    }
   private void showEmployeeName (HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        String name = request.getParameter("name");
        request.setAttribute("employeeName",iEmployeeService.showName(name));
        request.getRequestDispatcher("employee/searchName.jsp").forward(request,response);
   }
}
