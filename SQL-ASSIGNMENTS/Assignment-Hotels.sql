Create Database Hotels
Use Hotels

CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

CREATE TABLE room
( room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL);	

CREATE TABLE booking
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL);

CREATE TABLE guest
( guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

--Alter table hotel
--Add constraint pk_hotel Primary Key (hotel_no)

--Alter table room
--Add Constraint pk_room Primary Key (room_no)

--Alter table room
--Add constraint fk_room foreign key (hotel_no) references hotel(hotel_no)



INSERT INTO hotel
VALUES ('H111', 'Grosvenor Hotel', 'London');

INSERT INTO room
VALUES ('1', 'H111', 'S', 72.00);

INSERT INTO guest
VALUES ('G111', 'John Smith', 'London');

INSERT INTO booking
VALUES ('H111', 'G111', '1999-01-01',
'1999-01-02', '1');

Select * from hotel, room, guest, booking

UPDATE room SET price = price*1.05;

CREATE TABLE booking_archive
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL);

INSERT INTO booking_archive
SELECT * FROM booking
WHERE date_to < '2000-01-01';

Select * from booking_archive

DELETE FROM booking
WHERE date_to = '2000-01-01';

--Simple Queries

--1. List full details of all hotels.

Select * from hotel

--2. List full details of all hotels in London.

Select * from hotel where address = 'London'

--3. List the names and addresses of all guests in London, alphabetically ordered by name.

Select name, address from guest where address = 'London' Order By name ASC


--4. List all double or family rooms with a price below £40.00 per night, in ascending order of price.

Select * from room where price < 40.00 AND type IN ('F', 'D') Order By price ASC

--5. List the bookings for which no date_to has been specified.

Select * from booking where date_to IS NULL

Select * from guest
Select * from booking
Select * from room
Select * from hotel

--Aggregate Queries

--1. How many hotels are there?

Select Count(hotel_no) AS Total_Hotels from hotel

--2. What is the average price of a room?

Select AVG(price) As Average_Price from room

--3. What is the total revenue per night from all double rooms?

Select SUM(price) AS Total_Revenue from room

--4. How many different guests have made bookings for August?

Select Count(guest_no) AS Total_Guest_in_August from booking where MONTH(date_to) = 8

Select * from guest
Select * from booking
Select * from room
Select * from hotel

--Subqueries and Joins

--1. List the price and type of all rooms at the Grosvenor Hotel.

Select price, type from room join hotel on room.hotel_no = hotel.hotel_no where name = 'Grosvenor Hotel'

--2. List all guests currently staying at the Grosvenor Hotel.

Select g.name, h.name from guest g join hotel h on g.address = h.address

--3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.

Select r.*, g.name from room r join hotel h on r.hotel_no = h.hotel_no
join guest g on h.address = g.address where h.name = 'Grosvenor Hotel'

--4. What is the total income from bookings for the Grosvenor Hotel today?

Select SUM(r.price) from room r join hotel h on r.hotel_no = h.hotel_no 
join booking b on b.hotel_no = h.hotel_no where date_to = GETDATE()
AND name = 'Grosvenor Hotel'

--5. List the rooms that are currently unoccupied at the Grosvenor Hotel

SELECT r.room_no
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
);


--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
SELECT SUM(r.price)
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE h.name = 'Grosvenor Hotel'
AND r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
);


Select * from guest
Select * from booking
Select * from room
Select * from hotel

--Grouping

--1. List the number of rooms in each hotel.

Select Count(r.room_no) AS Number_of_rooms from room r join  hotel h on r.hotel_no = h.hotel_no where name = 'Grosvenor Hotel'

--2. List the number of rooms in each hotel in London.

Select h.name, Count(r.room_no) as Number_of_rooms from room r join  hotel h on r.hotel_no = h.hotel_no where address = 'London'

--3. What is the average number of bookings for each hotel in August?


SELECT AVG(August_Count)
FROM (
    SELECT hotel_no,
           COUNT(*) AS August_Count
    FROM booking
    WHERE MONTH(date_from) = 8
    GROUP BY hotel_no
) AS temp;


--4. What is the most commonly booked room type for each hotel in London?
SELECT h.name, r.type, COUNT(b.room_no) AS 'Booking Count'
FROM booking b
JOIN room r 
ON b.room_no = r.room_no AND b.hotel_no = r.hotel_no
JOIN hotel h 
ON b.hotel_no = h.hotel_no
WHERE h.address = 'London'
GROUP BY h.name, r.type

--5. What is the lost income from unoccupied rooms at each hotel today?
SELECT h.name, SUM(r.price) AS 'Lost Income'
FROM room r
JOIN hotel h ON r.hotel_no = h.hotel_no
WHERE r.room_no NOT IN (
    SELECT room_no
    FROM booking
    WHERE date_to IS NULL
)
GROUP BY h.name