package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoveServlet", urlPatterns = "/hello")
public class LoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


                String serviceDiscount = request.getParameter("pd");
                double listPrice = Double.parseDouble(request.getParameter("LP"));
                double discountPercent = Double.parseDouble(request.getParameter("DP"));
                double discountAmount = listPrice*discountPercent*0.01;
                double discountPrice =  listPrice -  discountAmount;

                request.setAttribute("resultAmount",discountAmount);
                request.setAttribute("resultPrice",discountPrice);
                request.getRequestDispatcher("result.jsp").forward(request,response);

            }
        }
