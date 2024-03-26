USE littlelemondb;
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //

CREATE PROCEDURE CheckBooking (IN booking_date DATE, IN table_number INT)
BEGIN
IF EXISTS(SELECT * FROM bookings WHERE date = booking_date AND table_number = table_number)
THEN
SELECT CONCAT("Table " , table_number, " is already booked") AS `Booking status`; 
ELSE
SELECT CONCAT("Table " , table_number, " is empty") AS `Booking status`; 
END IF;
END //

DELIMITER ;

CALL CheckBooking('2024/03/22',2);