package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import utils.DBUtils;

public class OrderDAO {
    
    // 1. Chức năng tìm kiếm nâng cao: Theo ID hoặc theo Trạng thái (Pending, Processing, Done...)
    public List<Order> searchOrders(String searchId, String status) {
        List<Order> list = new ArrayList<>();
        // Dùng JOIN để lấy được FullName của khách hàng từ bảng User
        StringBuilder sql = new StringBuilder(
            "SELECT o.*, u.FullName FROM Orders o JOIN [User] u ON o.UserID = u.UserID WHERE 1=1 "
        );
        
        // Nối chuỗi SQL tùy theo điều kiện người dùng nhập
        if (searchId != null && !searchId.trim().isEmpty()) {
            sql.append(" AND o.OrderID = ? ");
        }
        if (status != null && !status.trim().isEmpty() && !status.equals("All")) {
            sql.append(" AND o.Status = ? ");
        }
        sql.append(" ORDER BY o.OrderDate DESC");

        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
             
            int paramIndex = 1;
            if (searchId != null && !searchId.trim().isEmpty()) {
                ps.setInt(paramIndex++, Integer.parseInt(searchId.trim()));
            }
            if (status != null && !status.trim().isEmpty() && !status.equals("All")) {
                ps.setString(paramIndex, status);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Order(
                        rs.getInt("OrderID"), rs.getInt("UserID"), rs.getDate("OrderDate"),
                        rs.getDouble("TotalAmount"), rs.getString("Status"), rs.getString("PaymentMethod"),
                        rs.getString("ShippingAddress"), rs.getString("PhoneNumber"), rs.getString("FullName")
                    ));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 2. Chức năng cập nhật trạng thái đơn hàng (Dùng cho AJAX)
    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE Orders SET Status = ? WHERE OrderID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }
}