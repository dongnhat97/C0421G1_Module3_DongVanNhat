package ServletCalculator;

import Calculator.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/index")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           float firstOperand = 0.0f;
           float secondOperand = 0.0f;
           try {
               firstOperand = Integer.parseInt(request.getParameter("first"));
               secondOperand = Integer.parseInt(request.getParameter("end"));
           }catch (NumberFormatException e ) {
               System.out.println(e.getMessage());
           }
           char operator = request.getParameter("operator").charAt(0);
           float result = Calculator.calculate(firstOperand,secondOperand,operator);
           request.setAttribute("resultServlet",result);
           request.getRequestDispatcher("result.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
