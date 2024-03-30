CREATE DATABASE hotelapp;

CREATE TABLE HotelChains (
    ChainID INT  PRIMARY KEY,
    ChainName VARCHAR(255),
    HQAddress VARCHAR(255),
    NumHotels INT,
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20)
);

CREATE TABLE Hotels (
    HotelID INT  PRIMARY KEY,
    ChainID INT,
    HotelName VARCHAR(255),
    Category INT,
    HotelAddress VARCHAR(255),
    NumRooms INT,
    ContactEmail VARCHAR(255),
    ContactPhone VARCHAR(20),
    FOREIGN KEY (ChainID) REFERENCES HotelChains(ChainID)
);

CREATE TABLE Employee (
    EID INT  PRIMARY KEY,
    HotelID INT,
    FullName VARCHAR(255),
    Address VARCHAR(255),
    SSN VARCHAR(11),
    Role VARCHAR(100),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE Customers (
    CustomerID INT  PRIMARY KEY,
    FullName VARCHAR(255),
    Address VARCHAR(255),
    IDType VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE Bookings (
    BookingID INT  PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    BookingDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Rooms (
    RoomID INT  PRIMARY KEY,
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
    RentingID INT  PRIMARY KEY,
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
    AmenityID INT  PRIMARY KEY,
    AmenityName VARCHAR(255)
);

CREATE TABLE RoomAmenities (
    RoomID INT,
    AmenityID INT,
    PRIMARY KEY (RoomID, AmenityID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (AmenityID) REFERENCES Amenities(AmenityID)
);


-- INSERT DUMMY DATA

-- Inserting hotel chains
INSERT INTO HotelChains (ChainID, Category, ChainName, HQAddress, NumHotels, ContactEmail, ContactPhone) 
VALUES
(1, 'Simple Stay', '123 Main St, CityA', 8, 'info@simplestay1.com', '123-456-7890'),
(2, 'Grand Suites', '123 Main St, CityA', 8, 'info@simplestay1.com', '123-456-7890'),
(3, 'Paradise Hotels', '123 Main St, CityA', 8, 'info@simplestay1.com', '123-456-7890'),
(4, 'Tranquil Inns', '123 Main St, CityA', 8, 'info@simplestay1.com', '123-456-7890'),
(5, 'Serene Retreats', '123 Main St, CityA', 8, 'info@simplestay1.com', '123-456-7890');

-- Inserting hotels for Simple Stay chain
INSERT INTO Hotels (HotelID, ChainID, HotelName, Category, HotelAddress, NumRooms, ContactEmail, ContactPhone)
VALUES
(1, 1, 'Simple Stay 1', 1, '123 Main St, CityA', 7, 'info@simplestay1.com', '123-456-7890'),
(2, 1, 'Simple Stay 2', 2, '456 Elm St, CityB', 8, 'info@simplestay2.com', '234-567-8901'),
(3, 1, 'Simple Stay 3', 3, '789 Oak St, CityC', 9, 'info@simplestay3.com', '345-678-9012'),
(4, 1, 'Simple Stay 4', 4, '321 Pine St, CityD', 6, 'info@simplestay4.com', '456-789-0123'),
(5, 1, 'Simple Stay 5', 5, '654 Maple St, CityE', 5, 'info@simplestay5.com', '567-890-1234'),
(6, 1, 'Simple Stay 6', 1, '987 Cedar St, CityF', 10, 'info@simplestay6.com', '678-901-2345'),
(7, 1, 'Simple Stay 7', 2, '123 Birch St, CityG', 7, 'info@simplestay7.com', '789-012-3456'),
(8, 1, 'Simple Stay 8', 3, '456 Walnut St, CityH', 8, 'info@simplestay8.com', '890-123-4567');

-- Inserting hotels for Grand Suites chain
INSERT INTO Hotels (HotelID, ChainID, HotelName, Category, HotelAddress, NumRooms, ContactEmail, ContactPhone)
VALUES
(9, 2, 'Grand Suites 1', 4, '123 Main St, CityA', 9, 'info@grandsuites1.com', '123-456-7890'),
(10, 2, 'Grand Suites 2', 5, '456 Elm St, CityB', 6, 'info@grandsuites2.com', '234-567-8901'),
(11, 2, 'Grand Suites 3', 1, '789 Oak St, CityC', 7, 'info@grandsuites3.com', '345-678-9012'),
(12, 2, 'Grand Suites 4', 2, '321 Pine St, CityD', 8, 'info@grandsuites4.com', '456-789-0123'),
(13, 2, 'Grand Suites 5', 3, '654 Maple St, CityE', 10, 'info@grandsuites5.com', '567-890-1234'),
(14, 2, 'Grand Suites 6', 4, '987 Cedar St, CityF', 5, 'info@grandsuites6.com', '678-901-2345'),
(15, 2, 'Grand Suites 7', 5, '123 Birch St, CityG', 9, 'info@grandsuites7.com', '789-012-3456'),
(16, 2, 'Grand Suites 8', 1, '456 Walnut St, CityH', 7, 'info@grandsuites8.com', '890-123-4567');

-- Inserting hotels for Paradise Hotels chain
INSERT INTO Hotels (HotelID, ChainID, HotelName, Category, HotelAddress, NumRooms, ContactEmail, ContactPhone)
VALUES
(17, 3, 'Paradise Hotels 1', 2, '123 Main St, CityA', 5, 'info@paradisehotels1.com', '123-456-7890'),
(18, 3, 'Paradise Hotels 2', 3, '456 Elm St, CityB', 8, 'info@paradisehotels2.com', '234-567-8901'),
(19, 3, 'Paradise Hotels 3', 4, '789 Oak St, CityC', 6, 'info@paradisehotels3.com', '345-678-9012'),
(20, 3, 'Paradise Hotels 4', 5, '321 Pine St, CityD', 7, 'info@paradisehotels4.com', '456-789-0123'),
(21, 3, 'Paradise Hotels 5', 1, '654 Maple St, CityE', 10, 'info@paradisehotels5.com', '567-890-1234'),
(22, 3, 'Paradise Hotels 6', 2, '987 Cedar St, CityF', 9, 'info@paradisehotels6.com', '678-901-2345'),
(23, 3, 'Paradise Hotels 7', 3, '123 Birch St, CityG', 7, 'info@paradisehotels7.com', '789-012-3456'),
(24, 3, 'Paradise Hotels 8', 4, '456 Walnut St, CityH', 6, 'info@paradisehotels8.com', '890-123-4567');

-- Inserting hotels for Tranquil Inns chain
INSERT INTO Hotels (HotelID, ChainID, HotelName, Category, HotelAddress, NumRooms, ContactEmail, ContactPhone)
VALUES
(25, 4, 'Tranquil Inns 1', 5, '123 Main St, CityA', 8, 'info@tranquilinns1.com', '123-456-7890'),
(26, 4, 'Tranquil Inns 2', 1, '456 Elm St, CityB', 9, 'info@tranquilinns2.com', '234-567-8901'),
(27, 4, 'Tranquil Inns 3', 2, '789 Oak St, CityC', 7, 'info@tranquilinns3.com', '345-678-9012'),
(28, 4, 'Tranquil Inns 4', 3, '321 Pine St, CityD', 6, 'info@tranquilinns4.com', '456-789-0123'),
(29, 4, 'Tranquil Inns 5', 4, '654 Maple St, CityE', 10, 'info@tranquilinns5.com', '567-890-1234'),
(30, 4, 'Tranquil Inns 6', 5, '987 Cedar St, CityF', 8, 'info@tranquilinns6.com', '678-901-2345'),
(31, 4, 'Tranquil Inns 7', 1, '123 Birch St, CityG', 5, 'info@tranquilinns7.com', '789-012-3456'),
(32, 4, 'Tranquil Inns 8', 2, '456 Walnut St, CityH', 7, 'info@tranquilinns8.com', '890-123-4567');

-- Inserting hotels for Serene Retreats chain
INSERT INTO Hotels (HotelID, ChainID, HotelName, Category, HotelAddress, NumRooms, ContactEmail, ContactPhone)
VALUES
(33, 5, 'Serene Retreats 1', 3, '123 Main St, CityA', 8, 'info@sereneretreats1.com', '123-456-7890'),
(34, 5, 'Serene Retreats 2', 4, '456 Elm St, CityB', 9, 'info@sereneretreats2.com', '234-567-8901'),
(35, 5, 'Serene Retreats 3', 5, '789 Oak St, CityC', 7, 'info@sereneretreats3.com', '345-678-9012'),
(36, 5, 'Serene Retreats 4', 1, '321 Pine St, CityD', 6, 'info@sereneretreats4.com', '456-789-0123'),
(37, 5, 'Serene Retreats 5', 2, '654 Maple St, CityE', 10, 'info@sereneretreats5.com', '567-890-1234'),
(38, 5, 'Serene Retreats 6', 3, '987 Cedar St, CityF', 8, 'info@sereneretreats6.com', '678-901-2345'),
(39, 5, 'Serene Retreats 7', 4, '123 Birch St, CityG', 5, 'info@sereneretreats7.com', '789-012-3456'),
(40, 5, 'Serene Retreats 8', 5, '456 Walnut St, CityH', 7, 'info@sereneretreats8.com', '890-123-4567');



