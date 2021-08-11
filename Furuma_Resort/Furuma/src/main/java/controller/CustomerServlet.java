package controller;

import model.bean.Customer;
import model.service.ICustomerService;
import model.service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    ICustomerService iCustomerService= new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                 break;
            case "update":

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
}
