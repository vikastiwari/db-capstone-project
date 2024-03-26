USE littlelemondb;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT * FROM bookings WHERE (booking_id = booking_id))
THEN
SELECT CONCAT("Error !!! Booking " , booking_id, " does not exist") AS `Error`;
ROLLBACK;
ELSE
DELETE FROM bookings WHERE booking_id = booking_id;
COMMIT;
SELECT CONCAT("Booking ", booking_id ," cancelled") AS `Confirmation`; 
END IF;
END //

DELIMITER ;

CALL CancelBooking(1);