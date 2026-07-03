package controller.admin;

import dao.CategoryDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet(name = "CategoryController", urlPatterns = {"/admin/category"})
public class CategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryDAO cDao = new CategoryDAO();
        
        if (action == null || action.equals("list")) {
            List<Category> list = cDao.getAllCategories();
            request.setAttribute("categories", list);
            request.getRequestDispatcher("category_list.jsp").forward(request, response);
            
        } else if (action.equals("create")) {
            request.getRequestDispatcher("category_form.jsp").forward(request, response);
            
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category c = cDao.getCategoryById(id);
            request.setAttribute("category", c);
            request.getRequestDispatcher("category_form.jsp").forward(request, response);
            
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            cDao.deleteCategory(id);
            response.sendRedirect("category?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryDAO cDao = new CategoryDAO();
        
        String categoryName = request.getParameter("categoryName");
        String description = request.getParameter("description");
        
        if (action.equals("create")) {
            Category c = new Category(0, categoryName, description);
            cDao.insertCategory(c);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category c = new Category(id, categoryName, description);
            cDao.updateCategory(c);
        }
        
        response.sendRedirect("category?action=list");
    }
}
