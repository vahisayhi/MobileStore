CREATE DATABASE MobileStoreDB;
GO

USE MobileStoreDB;
GO


CREATE TABLE Role(
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE [User](
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address NVARCHAR(255),
    Status BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    RoleID INT NOT NULL,

    FOREIGN KEY (RoleID)
    REFERENCES Role(RoleID)
);

CREATE TABLE Brand(
    BrandID INT PRIMARY KEY IDENTITY(1,1),
    BrandName NVARCHAR(100) NOT NULL UNIQUE,
    Country NVARCHAR(100),
    Description NVARCHAR(255)
);

CREATE TABLE Category(
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(255)
);

CREATE TABLE Phone(
    PhoneID INT PRIMARY KEY IDENTITY(1,1),
    PhoneName NVARCHAR(255) NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    Quantity INT DEFAULT 0,
    Description NVARCHAR(MAX),
    Image VARCHAR(255),
    Status BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),

    BrandID INT NOT NULL,
    CategoryID INT NOT NULL,

    FOREIGN KEY (BrandID)
    REFERENCES Brand(BrandID),

    FOREIGN KEY (CategoryID)
    REFERENCES Category(CategoryID)
);

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(18,2) DEFAULT 0,

    Status VARCHAR(30) DEFAULT 'Pending',

    PaymentMethod VARCHAR(50),
    ShippingAddress NVARCHAR(255),
    PhoneNumber VARCHAR(20),

    FOREIGN KEY (UserID)
    REFERENCES [User](UserID)
);

CREATE TABLE OrderDetail(
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PhoneID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(18,2) NOT NULL,

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (PhoneID)
    REFERENCES Phone(PhoneID)
);

CREATE TABLE Cart
(
    CartID INT IDENTITY PRIMARY KEY,
    UserID INT NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY(UserID) REFERENCES [User](UserID)
);

CREATE TABLE CartItem
(
    CartItemID INT IDENTITY PRIMARY KEY,
    CartID INT NOT NULL,
    PhoneID INT NOT NULL,
    Quantity INT NOT NULL,
	 CONSTRAINT UQ_CartItem UNIQUE(CartID, PhoneID),
    FOREIGN KEY(CartID) REFERENCES Cart(CartID),
    FOREIGN KEY(PhoneID) REFERENCES Phone(PhoneID)
);

CREATE TABLE Review(
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    PhoneID INT NOT NULL,

    Rating INT CHECK(Rating BETWEEN 1 AND 5),
	UNIQUE(UserID, PhoneID),
    Comment NVARCHAR(500),
    CreatedDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (UserID)
    REFERENCES [User](UserID),

    FOREIGN KEY (PhoneID)
    REFERENCES Phone(PhoneID)
);

INSERT INTO Role VALUES
('Admin'),
('Staff'),
('Customer');

INSERT INTO Brand(BrandName, Country)
VALUES
(N'Apple', N'USA'),
(N'Samsung', N'Korea'),
(N'Xiaomi', N'China'),
(N'Oppo', N'China');

INSERT INTO Category(CategoryName)
VALUES
(N'Flagship'),
(N'Gaming'),
(N'Budget');

INSERT INTO [User]
(
    Username,
    Password,
    FullName,
    Email,
    Phone,
    Address,
    RoleID
)
VALUES
(
    'admin',
    '123456',
    N'Administrator',
    'admin@gmail.com',
    '0123456789',
    N'Ha Noi',
    1
);
INSERT INTO Phone
(
    PhoneName,
    UnitPrice,
    Quantity,
    Description,
    Image,
    BrandID,
    CategoryID
)
VALUES
(
    N'iPhone 16 Pro Max',
    32990000,
    20,
    N'Apple Flagship',
    'iphone16promax.jpg',
    1,
    1
),
(
    N'Samsung Galaxy S25 Ultra',
    30990000,
    15,
    N'Samsung Flagship',
    's25ultra.jpg',
    2,
    1
),
(
    N'Xiaomi 15',
    19990000,
    30,
    N'Xiaomi Flagship',
    'xiaomi15.jpg',
    3,
    1
);