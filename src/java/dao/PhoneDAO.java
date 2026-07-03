package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Phone;
import utils.DBUtils;

public class PhoneDAO {
    public List<Phone> getAllPhones() {
        List<Phone> list = new ArrayList<>();
        String sql = "SELECT * FROM Phone";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Phone(
                        rs.getInt("PhoneID"),
                        rs.getString("PhoneName"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("Quantity"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getBoolean("Status"),
                        rs.getDate("CreatedDate"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertPhone(Phone phone) {
        String sql = "INSERT INTO Phone(PhoneName, UnitPrice, Quantity, Description, Image, Status, BrandID, CategoryID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone.getPhoneName());
            ps.setDouble(2, phone.getUnitPrice());
            ps.setInt(3, phone.getQuantity());
            ps.setString(4, phone.getDescription());
            ps.setString(5, phone.getImage());
            ps.setBoolean(6, phone.isStatus());
            ps.setInt(7, phone.getBrandID());
            ps.setInt(8, phone.getCategoryID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePhone(Phone phone) {
        String sql = "UPDATE Phone SET PhoneName = ?, UnitPrice = ?, Quantity = ?, Description = ?, Image = ?, Status = ?, BrandID = ?, CategoryID = ? WHERE PhoneID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone.getPhoneName());
            ps.setDouble(2, phone.getUnitPrice());
            ps.setInt(3, phone.getQuantity());
            ps.setString(4, phone.getDescription());
            ps.setString(5, phone.getImage());
            ps.setBoolean(6, phone.isStatus());
            ps.setInt(7, phone.getBrandID());
            ps.setInt(8, phone.getCategoryID());
            ps.setInt(9, phone.getPhoneID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletePhone(int phoneID) {
        String sql = "DELETE FROM Phone WHERE PhoneID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, phoneID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Phone getPhoneById(int phoneID) {
        String sql = "SELECT * FROM Phone WHERE PhoneID = ?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, phoneID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Phone(
                            rs.getInt("PhoneID"),
                            rs.getString("PhoneName"),
                            rs.getDouble("UnitPrice"),
                            rs.getInt("Quantity"),
                            rs.getString("Description"),
                            rs.getString("Image"),
                            rs.getBoolean("Status"),
                            rs.getDate("CreatedDate"),
                            rs.getInt("BrandID"),
                            rs.getInt("CategoryID")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
