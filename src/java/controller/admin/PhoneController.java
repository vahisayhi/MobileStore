package controller.admin;

import dao.PhoneDAO;
import dao.BrandDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Phone;

@WebServlet(name = "PhoneController", urlPatterns = {"/admin/phone"})
public class PhoneController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        PhoneDAO pDao = new PhoneDAO();
        
        if (action == null || action.equals("list")) {
            List<Phone> list = pDao.getAllPhones();
            request.setAttribute("phones", list);
            request.getRequestDispatcher("phone_list.jsp").forward(request, response);
            
        } else if (action.equals("create")) {
            request.setAttribute("brands", new BrandDAO().getAllBrands());
            request.setAttribute("categories", new CategoryDAO().getAllCategories());
            request.getRequestDispatcher("phone_form.jsp").forward(request, response);
            
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Phone p = pDao.getPhoneById(id);
            request.setAttribute("phone", p);
            request.setAttribute("brands", new BrandDAO().getAllBrands());
            request.setAttribute("categories", new CategoryDAO().getAllCategories());
            request.getRequestDispatcher("phone_form.jsp").forward(request, response);
            
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            pDao.deletePhone(id);
            response.sendRedirect("phone?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        PhoneDAO pDao = new PhoneDAO();
        
        String phoneName = request.getParameter("phoneName");
        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        boolean status = request.getParameter("status") != null;
        int brandID = Integer.parseInt(request.getParameter("brandID"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        
        if (action.equals("create")) {
            Phone p = new Phone(0, phoneName, unitPrice, quantity, description, image, status, null, brandID, categoryID);
            pDao.insertPhone(p);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Phone p = new Phone(id, phoneName, unitPrice, quantity, description, image, status, null, brandID, categoryID);
            pDao.updatePhone(p);
        }
        
        response.sendRedirect("phone?action=list");
    }
}
