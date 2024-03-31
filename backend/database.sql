CREATE DATABASE IF NOT EXISTS hotelapp;

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

--Inserting ROOMS

-- Inserting rooms for Simple Stay 1
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(1, 1, '101', 100.00, 2, true, false, true, 'N/A'),
(2, 1, '102', 120.00, 4, true, true, false, 'N/A'),
(3, 1, '103', 150.00, 3, false, true, true, 'N/A'),
(4, 1, '104', 80.00, 1, false, false, true, 'N/A'),
(5, 1, '105', 200.00, 5, true, true, true, 'N/A');

-- Inserting rooms for Simple Stay 2
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(6, 2, '101', 110.00, 3, false, false, true, 'N/A'),
(7, 2, '102', 130.00, 5, true, false, true, 'N/A'),
(8, 2, '103', 140.00, 2, true, true, false, 'N/A'),
(9, 2, '104', 90.00, 4, false, true, true, 'N/A'),
(10, 2, '105', 180.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Simple Stay 3
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(11, 3, '101', 120.00, 4, true, false, true, 'N/A'),
(12, 3, '102', 130.00, 2, true, true, false, 'N/A'),
(13, 3, '103', 160.00, 5, false, true, true, 'N/A'),
(14, 3, '104', 100.00, 3, false, false, true, 'N/A'),
(15, 3, '105', 220.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Simple Stay 4
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(16, 4, '101', 130.00, 5, false, true, true, 'N/A'),
(17, 4, '102', 140.00, 3, true, true, false, 'N/A'),
(18, 4, '103', 150.00, 2, true, false, true, 'N/A'),
(19, 4, '104', 110.00, 4, false, false, true, 'N/A'),
(20, 4, '105', 240.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Simple Stay 5
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(21, 5, '101', 140.00, 3, true, true, true, 'N/A'),
(22, 5, '102', 150.00, 5, false, true, true, 'N/A'),
(23, 5, '103', 170.00, 2, true, false, true, 'N/A'),
(24, 5, '104', 120.00, 4, true, false, false, 'N/A'),
(25, 5, '105', 260.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 1
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(26, 9, '101', 150.00, 4, true, false, true, 'N/A'),
(27, 9, '102', 170.00, 2, true, true, false, 'N/A'),
(28, 9, '103', 180.00, 5, false, true, true, 'N/A'),
(29, 9, '104', 130.00, 3, false, false, true, 'N/A'),
(30, 9, '105', 280.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 2
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(31, 10, '101', 160.00, 3, true, true, true, 'N/A'),
(32, 10, '102', 180.00, 5, false, true, true, 'N/A'),
(33, 10, '103', 190.00, 2, true, false, false, 'N/A'),
(34, 10, '104', 140.00, 4, true, false, true, 'N/A'),
(35, 10, '105', 300.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 3
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(36, 11, '101', 170.00, 2, false, false, true, 'N/A'),
(37, 11, '102', 190.00, 4, true, true, false, 'N/A'),
(38, 11, '103', 200.00, 3, true, false, true, 'N/A'),
(39, 11, '104', 150.00, 5, false, true, true, 'N/A'),
(40, 11, '105', 320.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 4
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(41, 12, '101', 180.00, 3, true, false, true, 'N/A'),
(42, 12, '102', 200.00, 5, false, true, true, 'N/A'),
(43, 12, '103', 210.00, 2, true, false, false, 'N/A'),
(44, 12, '104', 160.00, 4, true, true, true, 'N/A'),
(45, 12, '105', 340.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 5
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(46, 13, '101', 190.00, 4, false, true, true, 'N/A'),
(47, 13, '102', 210.00, 2, true, false, false, 'N/A'),
(48, 13, '103', 220.00, 5, true, true, true, 'N/A'),
(49, 13, '104', 170.00, 3, false, false, true, 'N/A'),
(50, 13, '105', 360.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 6
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(51, 14, '101', 200.00, 5, true, true, true, 'N/A'),
(52, 14, '102', 220.00, 3, false, true, true, 'N/A'),
(53, 14, '103', 230.00, 2, true, false, false, 'N/A'),
(54, 14, '104', 180.00, 4, true, false, true, 'N/A'),
(55, 14, '105', 380.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 7
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(56, 15, '101', 210.00, 3, true, true, true, 'N/A'),
(57, 15, '102', 230.00, 5, false, true, true, 'N/A'),
(58, 15, '103', 240.00, 2, true, false, false, 'N/A'),
(59, 15, '104', 190.00, 4, true, false, true, 'N/A'),
(60, 15, '105', 400.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Grand Suites 8
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(61, 16, '101', 220.00, 4, false, true, true, 'N/A'),
(62, 16, '102', 240.00, 2, true, false, false, 'N/A'),
(63, 16, '103', 250.00, 5, true, true, true, 'N/A'),
(64, 16, '104', 200.00, 3, false, false, true, 'N/A'),
(65, 16, '105', 420.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 1
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(66, 17, '101', 230.00, 2, true, false, true, 'N/A'),
(67, 17, '102', 250.00, 4, false, true, true, 'N/A'),
(68, 17, '103', 260.00, 3, true, true, false, 'N/A'),
(69, 17, '104', 210.00, 5, true, false, true, 'N/A'),
(70, 17, '105', 440.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 2
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(71, 18, '101', 240.00, 3, true, true, true, 'N/A'),
(72, 18, '102', 260.00, 5, false, true, true, 'N/A'),
(73, 18, '103', 270.00, 2, true, false, false, 'N/A'),
(74, 18, '104', 220.00, 4, true, false, true, 'N/A'),
(75, 18, '105', 460.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 3
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(76, 19, '101', 250.00, 4, false, true, true, 'N/A'),
(77, 19, '102', 270.00, 2, true, false, false, 'N/A'),
(78, 19, '103', 280.00, 5, true, true, true, 'N/A'),
(79, 19, '104', 230.00, 3, false, false, true, 'N/A'),
(80, 19, '105', 480.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 4
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(81, 20, '101', 260.00, 3, true, false, true, 'N/A'),
(82, 20, '102', 280.00, 5, false, true, true, 'N/A'),
(83, 20, '103', 290.00, 2, true, true, false, 'N/A'),
(84, 20, '104', 240.00, 4, true, false, true, 'N/A'),
(85, 20, '105', 500.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 5
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(86, 21, '101', 270.00, 4, false, true, true, 'N/A'),
(87, 21, '102', 290.00, 2, true, false, false, 'N/A'),
(88, 21, '103', 300.00, 5, true, true, true, 'N/A'),
(89, 21, '104', 250.00, 3, false, false, true, 'N/A'),
(90, 21, '105', 520.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 6
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(91, 22, '101', 280.00, 5, true, true, true, 'N/A'),
(92, 22, '102', 300.00, 3, false, true, true, 'N/A'),
(93, 22, '103', 310.00, 2, true, false, false, 'N/A'),
(94, 22, '104', 260.00, 4, true, false, true, 'N/A'),
(95, 22, '105', 540.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 7
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(96, 23, '101', 290.00, 3, true, true, true, 'N/A'),
(97, 23, '102', 310.00, 5, false, true, true, 'N/A'),
(98, 23, '103', 320.00, 2, true, false, false, 'N/A'),
(99, 23, '104', 270.00, 4, true, false, true, 'N/A'),
(100, 23, '105', 560.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Paradise Hotels 8
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(101, 24, '101', 300.00, 4, false, true, true, 'N/A'),
(102, 24, '102', 320.00, 2, true, false, false, 'N/A'),
(103, 24, '103', 330.00, 5, true, true, true, 'N/A'),
(104, 24, '104', 280.00, 3, false, false, true, 'N/A'),
(105, 24, '105', 580.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 1
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(106, 25, '101', 310.00, 3, true, true, true, 'N/A'),
(107, 25, '102', 330.00, 5, false, true, true, 'N/A'),
(108, 25, '103', 340.00, 2, true, false, false, 'N/A'),
(109, 25, '104', 290.00, 4, true, false, true, 'N/A'),
(110, 25, '105', 600.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 2
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(111, 26, '101', 320.00, 4, false, true, true, 'N/A'),
(112, 26, '102', 340.00, 2, true, false, false, 'N/A'),
(113, 26, '103', 350.00, 5, true, true, true, 'N/A'),
(114, 26, '104', 300.00, 3, false, false, true, 'N/A'),
(115, 26, '105', 620.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 3
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(116, 27, '101', 330.00, 3, true, true, true, 'N/A'),
(117, 27, '102', 350.00, 5, false, true, true, 'N/A'),
(118, 27, '103', 360.00, 2, true, false, false, 'N/A'),
(119, 27, '104', 310.00, 4, true, false, true, 'N/A'),
(120, 27, '105', 640.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 4
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(121, 28, '101', 340.00, 4, false, true, true, 'N/A'),
(122, 28, '102', 360.00, 2, true, false, false, 'N/A'),
(123, 28, '103', 370.00, 5, true, true, true, 'N/A'),
(124, 28, '104', 320.00, 3, false, false, true, 'N/A'),
(125, 28, '105', 660.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 5
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(126, 29, '101', 350.00, 3, true, true, true, 'N/A'),
(127, 29, '102', 370.00, 5, false, true, true, 'N/A'),
(128, 29, '103', 380.00, 2, true, false, false, 'N/A'),
(129, 29, '104', 330.00, 4, true, false, true, 'N/A'),
(130, 29, '105', 680.00, 1, true, true, true, 'N/A');

-- Inserting rooms for Tranquil Inns 6
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(136, 30, '106', 370.00, 1, true, true, true, 'N/A'),
(137, 30, '107', 390.00, 2, true, false, false, 'N/A'),
(138, 30, '108', 400.00, 3, false, true, true, 'N/A'),
(139, 30, '109', 350.00, 4, true, false, true, 'N/A'),
(140, 30, '110', 720.00, 5, false, false, true, 'N/A');

-- Inserting rooms for Tranquil Inns 7
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(141, 31, '101', 380.00, 2, true, true, true, 'N/A'),
(142, 31, '102', 400.00, 4, false, true, true, 'N/A'),
(143, 31, '103', 410.00, 1, true, false, false, 'N/A'),
(144, 31, '104', 360.00, 3, true, false, true, 'N/A'),
(145, 31, '105', 740.00, 5, false, false, true, 'N/A');

-- Inserting rooms for Tranquil Inns 8
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(146, 32, '101', 390.00, 2, true, true, true, 'N/A'),
(147, 32, '102', 410.00, 4, false, true, true, 'N/A'),
(148, 32, '103', 420.00, 1, true, false, false, 'N/A'),
(149, 32, '104', 370.00, 3, true, false, true, 'N/A'),
(150, 32, '105', 760.00, 5, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 1
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(151, 33, '101', 400.00, 1, true, true, true, 'N/A'),
(152, 33, '102', 420.00, 2, false, true, true, 'N/A'),
(153, 33, '103', 430.00, 3, true, false, false, 'N/A'),
(154, 33, '104', 380.00, 4, true, false, true, 'N/A'),
(155, 33, '105', 780.00, 5, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 2
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(156, 34, '101', 410.00, 2, true, true, true, 'N/A'),
(157, 34, '102', 430.00, 4, false, true, true, 'N/A'),
(158, 34, '103', 440.00, 1, true, false, false, 'N/A'),
(159, 34, '104', 390.00, 3, true, false, true, 'N/A'),
(160, 34, '105', 800.00, 5, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 3
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(161, 35, '101', 420.00, 3, true, true, true, 'N/A'),
(162, 35, '102', 440.00, 5, false, true, true, 'N/A'),
(163, 35, '103', 450.00, 1, true, false, false, 'N/A'),
(164, 35, '104', 400.00, 4, true, false, true, 'N/A'),
(165, 35, '105', 820.00, 2, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 4
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(166, 36, '101', 430.00, 4, true, true, true, 'N/A'),
(167, 36, '102', 450.00, 2, false, true, true, 'N/A'),
(168, 36, '103', 460.00, 5, true, false, false, 'N/A'),
(169, 36, '104', 410.00, 3, true, false, true, 'N/A'),
(170, 36, '105', 840.00, 1, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 5
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(171, 37, '101', 440.00, 3, true, true, true, 'N/A'),
(172, 37, '102', 460.00, 5, false, true, true, 'N/A'),
(173, 37, '103', 470.00, 1, true, false, false, 'N/A'),
(174, 37, '104', 420.00, 4, true, false, true, 'N/A'),
(175, 37, '105', 860.00, 2, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 6
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(176, 38, '101', 450.00, 4, true, true, true, 'N/A'),
(177, 38, '102', 470.00, 2, false, true, true, 'N/A'),
(178, 38, '103', 480.00, 5, true, false, false, 'N/A'),
(179, 38, '104', 430.00, 3, true, false, true, 'N/A'),
(180, 38, '105', 880.00, 1, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 7
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(181, 39, '101', 460.00, 3, true, true, true, 'N/A'),
(182, 39, '102', 480.00, 5, false, true, true, 'N/A'),
(183, 39, '103', 490.00, 1, true, false, false, 'N/A'),
(184, 39, '104', 440.00, 4, true, false, true, 'N/A'),
(185, 39, '105', 900.00, 2, false, false, true, 'N/A');

-- Inserting rooms for Serene Retreats 8
INSERT INTO Rooms (RoomID, HotelID, RoomNumber, PricePerNight, Capacity, Seaview, MountainView, Extendable, MaintenanceNotes)
VALUES
(186, 40, '101', 470.00, 4, true, true, true, 'N/A'),
(187, 40, '102', 490.00, 2, false, true, true, 'N/A'),
(188, 40, '103', 500.00, 5, true, false, false, 'N/A'),
(189, 40, '104', 450.00, 3, true, false, true, 'N/A'),
(190, 40, '105', 920.00, 1, false, false, true, 'N/A');



