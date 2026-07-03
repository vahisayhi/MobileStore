package model;

public class Brand {
    private int brandID;
    private String brandName;
    private String country;
    private String description;

    public Brand() {
    }

    public Brand(int brandID, String brandName, String country, String description) {
        this.brandID = brandID;
        this.brandName = brandName;
        this.country = country;
        this.description = description;
    }

    public int getBrandID() { return brandID; }
    public void setBrandID(int brandID) { this.brandID = brandID; }
    public String getBrandName() { return brandName; }
    public void setBrandName(String brandName) { this.brandName = brandName; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
