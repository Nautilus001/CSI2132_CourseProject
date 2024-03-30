CREATE DATABASE hotelapp;

CREATE TABLE HotelChains (
    ChainID INT AUTO_INCREMENT PRIMARY KEY,
    Category INT,
    ChainName VARCHAR(255),
    HQAddress VARCHAR(255),
    NumHotels INT,
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20)
);

CREATE TABLE Hotels (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    ChainID INT,
    HotelName VARCHAR(255),
    HotelAddress VARCHAR(255),
    NumRooms INT,
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20),
    FOREIGN KEY (ChainID) REFERENCES HotelChains(ChainID)
);

CREATE TABLE Employee (
    EID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    FullName VARCHAR(255),
    Address VARCHAR(255),
    SSN VARCHAR(11),
    Role VARCHAR(100),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255),
    Address VARCHAR(255),
    IDType VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    BookingDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    RoomNumber VARCHAR(20),
    PricePerNight DECIMAL(10, 2),
    Capacity INT,
    Seaview BOOLEAN,
    MountainView BOOLEAN,
    Extendable BOOLEAN,
    MaintenanceNotes TEXT,
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Rentings (
    RentingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    EmployeeID INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    BookingDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EID)
);

CREATE TABLE Amenities (
    AmenityID INT AUTO_INCREMENT PRIMARY KEY,
    AmenityName VARCHAR(255)
);

CREATE TABLE RoomAmenities (
    RoomID INT,
    AmenityID INT,
    PRIMARY KEY (RoomID, AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (AmenityID) REFERENCES Amenities(AmenityID)
);

