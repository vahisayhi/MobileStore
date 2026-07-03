package model;

import java.util.Date;

public class Phone {
    private int phoneID;
    private String phoneName;
    private double unitPrice;
    private int quantity;
    private String description;
    private String image;
    private boolean status;
    private Date createdDate;
    private int brandID;
    private int categoryID;

    public Phone() {
    }

    public Phone(int phoneID, String phoneName, double unitPrice, int quantity, String description, String image, boolean status, Date createdDate, int brandID, int categoryID) {
        this.phoneID = phoneID;
        this.phoneName = phoneName;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.description = description;
        this.image = image;
        this.status = status;
        this.createdDate = createdDate;
        this.brandID = brandID;
        this.categoryID = categoryID;
    }

    public int getPhoneID() { return phoneID; }
    public void setPhoneID(int phoneID) { this.phoneID = phoneID; }
    public String getPhoneName() { return phoneName; }
    public void setPhoneName(String phoneName) { this.phoneName = phoneName; }
    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public boolean isStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }
    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }
    public int getBrandID() { return brandID; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
    public int getCategoryID() { return categoryID; }
    public void setCategoryID(int categoryID) { this.categoryID = categoryID; }
}
