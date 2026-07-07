package model;

import java.util.Date;

public class Order {
    private int orderID;
    private int userID;
    private Date orderDate;
    private double totalAmount;
    private String status;
    private String paymentMethod;
    private String shippingAddress;
    private String phoneNumber;
    
    // Thuộc tính bổ sung để hiển thị tên khách hàng trên bảng giao diện
    private String customerName; 

    public Order() {}

    public Order(int orderID, int userID, Date orderDate, double totalAmount, String status, String paymentMethod, String shippingAddress, String phoneNumber, String customerName) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.paymentMethod = paymentMethod;
        this.shippingAddress = shippingAddress;
        this.phoneNumber = phoneNumber;
        this.customerName = customerName;
    }

    // --- GETTERS & SETTERS ---
    public int getOrderID() { return orderID; }
    public void setOrderID(int orderID) { this.orderID = orderID; }
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public String getShippingAddress() { return shippingAddress; }
    public void setShippingAddress(String shippingAddress) { this.shippingAddress = shippingAddress; }
    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
}