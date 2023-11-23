# Cinema Database Queries 

This repo contains SQL queries for a cinema database. The database schema includes tables such as film, screening, room, seat, booking, reserved_seat, and customer.

## Queries
### Show film name ONLY which has screening.
```
SELECT DISTINCT f.name
FROM screening s
JOIN film f ON s.film_id = f.id
```
<img width="180" alt="Screen Shot 2023-11-23 at 9 41 20 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/653256d4-f611-4da9-a77e-135c17054f02">

### Show Room name with all seat row and seat column of "Room 2"
```
SELECT 
    r.name AS 'room_name',
    s.row AS 'seat_row',
    s.number AS 'seat_column'
FROM seat s
JOIN room r ON s.room_id = r.id
WHERE r.name = 'Room 2'
```
<img width="234" alt="Screen Shot 2023-11-23 at 9 41 41 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/a98de831-86ad-4271-bf6a-e25f73271b49">

### Show what seat that customer "Dung Nguyen" booked
```
SELECT first_name, last_name, s.row, s.number, s.room_id
FROM reserved_seat r
JOIN booking b ON r.booking_id = b.id
JOIN customer c ON b.customer_id = c.id
JOIN seat s ON r.seat_id = s.id
WHERE c.first_name = 'dung' AND c.last_name = 'nguyen'
```
<img width="285" alt="Screen Shot 2023-11-23 at 9 41 55 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/d22f89be-1efb-4ef9-afb9-e0f503f7eb23">

### How many films that showed in 24/5/2022
```
SELECT COUNT(DISTINCT f.name) AS 'num_of_film_shown'
FROM screening s 
JOIN film f ON s.film_id = f.id
WHERE
    s.start_time >= '2022-05-24 00:00:00'
	AND s.start_time < '2022-05-25 00:00:00'
```
<img width="151" alt="Screen Shot 2023-11-23 at 9 42 04 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/806de744-cfc6-4afe-b810-1a4561f2092f">

### What is the maximum length and minumum length of all film
```
SELECT 
    MIN(length_min) AS 'min_length',
    MAX(length_min) AS 'max_length'
FROM film
```
<img width="155" alt="Screen Shot 2023-11-23 at 9 42 13 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/bcddedda-12f7-476e-a172-2d244ba2c56a">

### How many seats of Room 7
```
SELECT COUNT(*) AS 'num_of_seat'
FROM seat s
JOIN room r ON s.room_id = r.id
WHERE r.name = 'Room 7'
```
<img width="110" alt="Screen Shot 2023-11-23 at 9 42 23 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/1621e18e-ce8d-4c7f-8a94-5ea5a678fcc2">


### Total seat are booked of film "Tom&Jerry"
```
SELECT COUNT(*) AS 'total_seat_booked'
FROM screening s
JOIN film f ON s.film_id = f.id
JOIN booking b ON b.screening_id = s.id
JOIN reserved_seat r ON r.booking_id = b.id
WHERE f.name = 'Tom&Jerry'
```
<img width="132" alt="Screen Shot 2023-11-23 at 9 42 32 pm" src="https://github.com/annaduong1012/CodingMentor_day19_SQLcinema/assets/111554660/d15bc108-68df-4af3-b4cf-ae9cd513b9e1">


