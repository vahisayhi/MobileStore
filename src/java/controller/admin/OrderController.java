package controller.admin;

import dao.OrderDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

@WebServlet(name = "OrderController", urlPatterns = {"/admin/order"})
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDAO oDao = new OrderDAO();
        
        if (action == null || action.equals("list")) {
            // Lấy tham số tìm kiếm từ URL
            String searchId = request.getParameter("searchId");
            String status = request.getParameter("statusFilter");
            
            List<Order> list = oDao.searchOrders(searchId, status);
            
            // Đẩy dữ liệu ra view
            request.setAttribute("orders", list);
            request.setAttribute("searchId", searchId);
            request.setAttribute("statusFilter", status);
            
            request.getRequestDispatcher("order_list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // NHIỆM VỤ BONUS: Nhận Request AJAX và cập nhật trạng thái ngầm
        if ("updateStatusAjax".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String newStatus = request.getParameter("status");
            
            OrderDAO dao = new OrderDAO();
            boolean success = dao.updateOrderStatus(orderId, newStatus);
            
            // Trả về kết quả chuỗi Text (Không tải lại trang)
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(success ? "success" : "fail");
        }
    }
}