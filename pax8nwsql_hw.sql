SELECT * FROM country WHERE Continent = "South America";

SELECT Population FROM country WHERE Name = "Germany";

SELECT * FROM city
JOIN country on city.CountryCode = country.Code
WHERE country.Name = "Japan";

SELECT * FROM country WHERE Continent = "Africa" ORDER BY Population DESC LIMIT 3;

SELECT Name, LifeExpectancy FROM country
WHERE Population > 1000000 AND Population < 5000000;

SELECT c.* FROM country c
JOIN countrylanguage cl ON cl.CountryCode = c.Code
WHERE cl.Language = "French" AND cl.IsOfficial = "T";

SELECT Title FROM Album
JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE Artist.Name = "AC/DC";

SELECT FirstName, LastName, Email FROM Customer
WHERE Country="Brazil";

SELECT COUNT(*) FROM Track
JOIN Genre ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = "Rock";

SELECT e.* FROM Employee e
JOIN Employee m ON m.EmployeeId = e.ReportsTo
WHERE m.FirstName = "Nancy" AND m.LastName = "Edwards";

SELECT c.FirstName, c.LastName, SUM(i.Total) FROM Customer c JOIN Invoice i ON i.CustomerId = c.CustomerId
GROUP BY c.FirstName, c.LastName;

CREATE TABLE Client (
	Client_ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(80),
    LastName VARCHAR(80),
    PhoneNumber INT,
    Email VARCHAR(80)
);

CREATE TABLE Animals (
	Animal_ID INT AUTO_INCREMENT PRIMARY KEY,
    AnimalName VARCHAR(80),
    Species VARCHAR(80),
    DailyRentalCost FLOAT
);

CREATE TABLE Rentals (
	Rental_ID INT AUTO_INCREMENT PRIMARY KEY,
    Client_ID INT,
    Animal_ID INT,
    RentalDate DATE,
    DurationDays INT,
    TotalCost FLOAT,
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Animal_ID) REFERENCES Animals(Animal_ID)
);

INSERT INTO Client (FirstName, LastName, PhoneNumber, Email)
VALUES 
('Bay', 'Wiggins', 5551234, 'bay@wiggins.com'),
('Shevya', 'Panda', 5555678, 'shevya.panda@example.com'),
('Jason', 'Williamson', 5559101, 'jas.will@example.com'),
('Bob', 'Bobson', 5553141, '1.2@example.com'),
('Idk', 'AtThisPoint', 5557231, '1.2@example.com');


INSERT INTO Animals (AnimalName, Species, DailyRentalCost)
VALUES
('Simba', 'Parrot', 100.00),
('Willow', 'Python', 200.00),
('Luna', 'Monkey', 300.00),
('Tesla', 'Kangaroo', 400.00),
('Toothless', 'Clownfish', 50.00);

INSERT INTO Rentals (Client_ID, Animal_ID, RentalDate, DurationDays, TotalCost)
VALUES
(1, 3, '2024-08-25', 2, 600.00),   
(2, 1, '2024-09-01', 1, 100.00),   
(3, 4, '2024-09-03', 3, 1200.00),  
(4, 2, '2024-09-05', 2, 400.00),  
(5, 5, '2024-09-07', 1, 50.00),    
(1, 4, '2024-09-10', 1, 400.00),  
(2, 2, '2024-09-12', 2, 400.00),   
(3, 5, '2024-09-15', 3, 150.00),  
(4, 3, '2024-09-18', 1, 300.00),  
(5, 1, '2024-09-20', 2, 200.00),   
(1, 5, '2024-09-22', 1, 50.00),    
(2, 3, '2024-09-25', 3, 900.00),  
(3, 1, '2024-09-28', 1, 100.00),   
(4, 4, '2024-09-30', 2, 800.00),   
(5, 2, '2024-10-02', 1, 200.00);   

SELECT Rentals.Rental_ID, Client.FirstName,
    	Client.LastName, Rentals.RentalDate, 		 
        Rentals.DurationDays, Rentals.TotalCost
FROM Rentals
JOIN Client ON Rentals.Client_ID = Client.Client_ID;

SELECT FirstName, LastName, Email
FROM Client;

SELECT AnimalName, DailyRentalCost
FROM Animals;
