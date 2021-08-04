package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", urlPatterns = "/search")
public class DictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String a =  request.getParameter("hello");
          Map<String,String> map = new HashMap<>();
           map.put("hello","xin chào");
           map.put("bye","tạm biệt");
           map.put("love","yêu");
           String b = null;
           if (map.containsKey(a)) {
               b = map.get(a);
           }else {
               b = "Không có đâu nha";
           }
           request.setAttribute("transl",b);
           request.getRequestDispatcher("translate.jsp").forward(request,response);
    }
}
