package controller;

import model.bean.User;
import model.service.IUserService;
import model.service.ipml.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", urlPatterns = {"/users", ""})
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                   create(request,response);
                break;
            case "update":
                try {
                    update(request,response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            case "delete":
                delete(request,response);
                break;
            case "search":
                search(request,response);
                break;
//            default:
//                createList(request,response);
//                break;
        }
    }
    private void create (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = new User();
//        Liên kết với khách hàng nhập từ bàn phím nè

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
//        thêm dữ liêu khách hàng nhập

        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        if ("Thêm thành công".equals(iUserService.save(user))) {
           request.setAttribute("message","Chúc mừng bạn đã thêm thành công");
           request.setAttribute("userListServlet",iUserService.findAll());
           request.getRequestDispatcher("user/list.jsp").forward(request,response);
        }else {
            request.setAttribute("message","Thêm lỗi rồi ");
            request.getRequestDispatcher("user/create.jsp").forward(request,response);
        }
    }
//    Hàm update
    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.findId(id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);

        if (iUserService.updateUser(user)) {
            request.setAttribute("message", "Chúc mừng bạn đã cập nhật thành công ");
            request.setAttribute("userListServlet",iUserService.findAll());
              request.getRequestDispatcher("user/list.jsp").forward(request,response);
        }else {
            request.setAttribute("message", "fail ");
            request.getRequestDispatcher("user/update.jsp").forward(request,response);
        }

    }
//    Hàm delete
    private  void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (iUserService.deleteUser(id)){
            request.setAttribute("message","Xóa thành công");
            request.setAttribute("userListServlet",iUserService.findAll());
            request.getRequestDispatcher("user/list.jsp").forward(request,response);
        }else {
            request.setAttribute("message","fail");
            request.getRequestDispatcher("user/delete.jsp").forward(request,response);
        }
    }
//    Hàm search theo tên thành phố
    private void search (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           String country = request.getParameter("country");
           if (iUserService.findCountry(country).size()>0) {
               request.setAttribute("message","Ok");
               request.setAttribute("listCountry",iUserService.findCountry(country));
               request.getRequestDispatcher("user/search.jsp").forward(request,response);
           }else {
               request.setAttribute("message","not exist");
               request.getRequestDispatcher("user/search.jsp");
           }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "detail":
                detail(request,response);
                break;
            case "update":
                updateShow(request,response);
                break;
            case "delete":
                deleteShow(request,response);
                break;
            case "search":
                searchCountry(request,response);
                break;
            case "orderBy":
                orderBy(request,response);
            default:

                showList(request,response);
                break;
        }
    }
// Hàm show bảng Creat
    private void showCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

//    Hàm show bang thêm mới user
    private void showList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("userListServlet", this.iUserService.findAll());
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

//    Hàm xem chi tiết thông tin user
    private void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("detailServlet",this.iUserService.findId(id));
        request.getRequestDispatcher("user/detail_user.jsp").forward(request,response);
    }

//    Hàm update User
    private  void updateShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("updateServlet",iUserService.findId(id));
        request.getRequestDispatcher("user/update.jsp").forward(request,response);
    }

//    Hàm delete
    private void deleteShow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("deleteServlet",iUserService.findId(id));
        request.getRequestDispatcher("user/delete.jsp").forward(request,response);
    }
//  Hàm tìm kiếm thông tin chứa cùng 1 thành phố
    private  void searchCountry(HttpServletRequest request,HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("user/search.jsp").forward(request,response);
    }
//    Hàm sắp xếp tên
    private  void  orderBy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("userListServlet",iUserService.findOrder());

       request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }
}
