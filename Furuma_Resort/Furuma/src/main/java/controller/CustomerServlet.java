package controller;

import model.bean.Customer;
import model.service.ICustomerService;
import model.service.ICustomerTypeService;
import model.service.impl.CustomerService;
import model.service.impl.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    ICustomerService iCustomerService= new CustomerService();
    ICustomerTypeService iCustomerTypeService = new CustomerTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_customer":
                CreateCustomer(request, response);
                break;
            case "update_customer":
                updateCustomer(request, response);
                break;
            case "delete":
                 deleteCustomer(request,response);
                break;
            case "showList":

                break;
            case "searchId":
                break;
            case "customer_list":
                break;
        }
    }
private void CreateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     Customer customer = new Customer();

     String code = request.getParameter("code");
     int typeId = Integer.parseInt(request.getParameter("typeId"));
     String name = request.getParameter("name");
     String  birthday = request.getParameter("birthday");
     int gender = Integer.parseInt(request.getParameter("gender"));
     String  idCar = request.getParameter("idCar");
     String  phone = request.getParameter("phone");
     String  email = request.getParameter("email");
     String  address = request.getParameter("address");
     customer.setCustomerCode(code);
     customer.setCustomerTypeId(typeId);
     customer.setCustomerName(name);
     customer.setCustomerBirthday(birthday);
     customer.setCustomerGender(gender);
     customer.setCustomerIdCar(idCar);
     customer.setCustomerPhone(phone);
     customer.setCustomerEmail(email);
     customer.setCustomerAddress(address);

     if ("true".equals(iCustomerService.saveCustomer(customer))) {
         request.setAttribute("message","thêm mới thành công ");
         try {
             request.setAttribute("CustomerList",iCustomerService.showCustomer());
         } catch (SQLException throwables) {
             throwables.printStackTrace();
         }
         request.getRequestDispatcher("customer/selectAll.jsp").forward(request,response);
     }else {
         request.setAttribute("message","thêm mới không thành công ");
         request.getRequestDispatcher("customer/create.jsp").forward(request,response);
     }
}
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.showId(id);

        String code = request.getParameter("code");
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String  birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String  idCar = request.getParameter("idCar");
        String  phone = request.getParameter("phone");
        String  email = request.getParameter("email");
        String  address = request.getParameter("address");


        customer.setCustomerCode(code);
        customer.setCustomerTypeId(typeId);
        customer.setCustomerName(name);
        customer.setCustomerBirthday(birthday);
        customer.setCustomerGender(gender);
        customer.setCustomerIdCar(idCar);
        customer.setCustomerPhone(phone);
        customer.setCustomerEmail(email);
        customer.setCustomerAddress(address);
        if (iCustomerService.updateCustomer(customer)) {
            request.setAttribute("message","Cập nhật thành công ");
            try {
                request.setAttribute("CustomerList",iCustomerService.showCustomer());
                request.getRequestDispatcher("customer/selectAll.jsp").forward(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }else {
            request.setAttribute("message","cập nhật thất bại");
            request.getRequestDispatcher("customer/update.jsp").forward(request,response);
        }
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("id"));
         if (iCustomerService.deleteCustomer(id)){
             request.setAttribute("message","Đã xóa thành công");
             try {
                 request.setAttribute("CustomerList",iCustomerService.showCustomer());
             } catch (SQLException throwables) {
                 throwables.printStackTrace();
             }
             request.getRequestDispatcher("customer/selectAll.jsp").forward(request,response);
         }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_customer":
              showCreate(request,response);
                 break;
            case "update_customer":
               showUpdate(request,response);
                break;
            case "delete":

                 break;
            case "showList":

                  break;
            case "searchId":
                break;
            case "customer_list":
                showCustomer(request,response);
                break;

        }
    }
    private void showCustomer (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> customerList = null;
        try {
            customerList = iCustomerService.showCustomer();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("CustomerList",customerList);
        request.getRequestDispatcher("customer/selectAll.jsp").forward(request,response);
    }
//    Hiển thị thêm mới
    private void showCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("lisCustomerType",iCustomerTypeService.showAll());
        request.getRequestDispatcher("customer/create.jsp").forward(request,response);

    }
//    Hiển thị update
    private void showUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("lisCustomerType",iCustomerTypeService.showAll());
        request.getRequestDispatcher("customer/update.jsp").forward(request,response);
    }
    private  void showDelete (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iCustomerService.showId(id);
        try {
            response.sendRedirect("/customers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
