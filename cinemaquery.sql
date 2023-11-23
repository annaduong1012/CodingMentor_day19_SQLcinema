#Show film name ONLY which has screening.
SELECT DISTINCT f.name
FROM screening s
JOIN film f ON s.film_id = f.id

#Show Room name with all seat row and seat column of "Room 2"
SELECT 
    r.name AS 'room_name',
    s.row AS 'seat_row',
    s.number AS 'seat_column'
FROM seat s
JOIN room r ON s.room_id = r.id
WHERE r.name = 'Room 2'

#Show what seat that customer "Dung Nguyen" booked
SELECT first_name, last_name, s.row, s.number, s.room_id
FROM reserved_seat r
JOIN booking b ON r.booking_id = b.id
JOIN customer c ON b.customer_id = c.id
JOIN seat s ON r.seat_id = s.id
WHERE c.first_name = 'dung' AND c.last_name = 'nguyen'

#How many film that showed in 24/5/2022
SELECT COUNT(DISTINCT f.name) AS 'num_of_film_shown'
FROM screening s 
JOIN film f ON s.film_id = f.id
WHERE
    s.start_time >= '2022-05-24 00:00:00'
	AND s.start_time < '2022-05-25 00:00:00'

#What is the maximum length and minumum length of all film
SELECT 
    MIN(length_min) AS 'min_length',
    MAX(length_min) AS 'max_length'
FROM film

#How many seat of Room 7
SELECT COUNT(*) AS 'num_of_seat'
FROM seat s
JOIN room r ON s.room_id = r.id
WHERE r.name = 'Room 7'

#Total seat are booked of film "Tom&Jerry"
SELECT COUNT(*) AS 'total_seat_booked'
FROM screening s
JOIN film f ON s.film_id = f.id
JOIN booking b ON b.screening_id = s.id
JOIN reserved_seat r ON r.booking_id = b.id
WHERE f.name = 'Tom&Jerry'


