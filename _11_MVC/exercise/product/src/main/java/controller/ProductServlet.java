package controller;

import model.bean.Product;
import model.service.IProductService;
import model.service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = {"/products",""})
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }
   private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
       Product product = this.iProductService.findById(id);
       RequestDispatcher dispatcher;
       if (product==null) {
           dispatcher = request.getRequestDispatcher("error-404.jsp");
       }else {
           this.iProductService.remove(id);
           try {
               response.sendRedirect("/products");
           } catch (IOException e) {
               e.printStackTrace();
           }
       }
   }
   private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("id"));
       String name = request.getParameter("name");
       int price = Integer.parseInt(request.getParameter("price"));
       String status = request.getParameter("status");
       String producer = request.getParameter("producer");
       RequestDispatcher dispatcher = null;
       Product product = this.iProductService.findById(id);
       if (product==null) {
           request.getRequestDispatcher("error-404.jsp");
       }else {
           product.setName(name);
           product.setPrice(price);
           product.setStatus(status);
           product.setProducer(producer);
           this.iProductService.update(id,product);
           request.setAttribute("customer", product);
           request.setAttribute("message", "Product information was updated");
           dispatcher = request.getRequestDispatcher("product/edit.jsp");
       }
       try {
           dispatcher.forward(request,response);
       }catch (ServletException e) {
           e.printStackTrace();
       }catch (IOException e ){
           e.printStackTrace();
       }
   }
   private void createProduct (HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
       String status = request.getParameter("status");
       String producer = request.getParameter("producer");
       int id = (int) (Math.random() * 10000);
       Product product = new Product(id,name,price,status,producer);
       this.iProductService.save(product);
       RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
       request.setAttribute("message","Đã cập nhật thành công");
       try {
             dispatcher.forward(request,response);
       }catch (ServletException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       }
   }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }

    }
    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.iProductService.findAll();
        request.setAttribute("products", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
