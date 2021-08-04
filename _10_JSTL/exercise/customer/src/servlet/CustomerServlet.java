package servlet;

import customer.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"","/Customer"})
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer("Mạnh đường quyền  ","1997-08-28","Hà Tĩnh","picture/3.jpg"));
        customers.add(new Customer("Phụt Bo","1995-11-18","Hà Tĩnh","picture/bo.jpg"));
        customers.add(new Customer("Văn Dẹp","1991-02-19","Hà Tĩnh","picture/kute.jpg"));
        request.setAttribute("CustomerServlet", customers);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
