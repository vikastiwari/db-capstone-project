USE littlelemondb;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (IN booking_id INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT * FROM bookings WHERE (booking_id = booking_id))
THEN
SELECT CONCAT("Error !!! Booking " , booking_id, " does not exist") AS `Error`;
ROLLBACK;
ELSE
UPDATE bookings SET date = booking_date WHERE booking_id = booking_id;
COMMIT;
SELECT CONCAT("Booking ", booking_id ," updated") AS `Confirmation`; 
END IF; 
END //

DELIMITER ;

CALL UpdateBooking(1,'2024/03/21');