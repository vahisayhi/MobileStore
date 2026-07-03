package controller.admin;

import dao.UserDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(name = "UserController", urlPatterns = {"/admin/user"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO uDao = new UserDAO();
        
        if (action == null || action.equals("list")) {
            List<User> list = uDao.getAllUsers();
            request.setAttribute("users", list);
            request.getRequestDispatcher("user_list.jsp").forward(request, response);
            
        } else if (action.equals("create")) {
            request.getRequestDispatcher("user_form.jsp").forward(request, response);
            
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User u = uDao.getUserById(id);
            request.setAttribute("user", u);
            request.getRequestDispatcher("user_form.jsp").forward(request, response);
            
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            uDao.deleteUser(id);
            response.sendRedirect("user?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO uDao = new UserDAO();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        boolean status = request.getParameter("status") != null;
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        
        if (action.equals("create")) {
            User u = new User(0, username, password, fullName, email, phone, address, status, null, roleID);
            uDao.insertUser(u);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User u = new User(id, username, password, fullName, email, phone, address, status, null, roleID);
            uDao.updateUser(u);
        }
        
        response.sendRedirect("user?action=list");
    }
}
