USE littlelemondb;
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
START TRANSACTION;
SELECT Max(booking_id) INTO @id FROM bookings;
SET @id = @id + 1;
IF EXISTS(SELECT * FROM bookings WHERE (date = booking_date AND table_number = table_number))
THEN
SELECT CONCAT("Table " , table_number, " is already booked - booking cancelled") AS `Booking status`; 
ROLLBACK;
ELSE
INSERT INTO bookings (booking_id, date, table_number, customer_id)
VALUES (@id, booking_date, table_number, customer_id);
COMMIT;
SELECT CONCAT("Booking for table " , table_number, " done") AS `Booking status`; 
END IF;
END //

DELIMITER ;

CALL AddValidBooking('2024/03/22',4,1);