USE littlelemondb;
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //

CREATE PROCEDURE AddBooking (IN booking_id INT, IN customer_id INT,  IN booking_date DATE, IN table_number INT)
BEGIN
START TRANSACTION;
IF EXISTS(SELECT * FROM bookings WHERE (booking_id = booking_id))
THEN
SELECT CONCAT("Error !!! Booking for booking_id : " , booking_id, " already exists ") AS `Error`;
ROLLBACK;
ELSE 
  IF EXISTS(SELECT * FROM bookings WHERE (date = booking_date AND table_number = table_number))
  THEN SELECT CONCAT("Error !!! Booking for table number : " , table_no, " already exists ") AS `Error`;
  ROLLBACK;
  
  ELSE
  INSERT INTO bookings (booking_id, date, table_number, customer_id) VALUES (booking_id, booking_date, table_number, customer_id);
  COMMIT;
  SELECT CONCAT("New booking added.") AS `Confirmation`; 
  END IF; 
END IF;  
END //

DELIMITER ;

CALL AddBooking(1,2,'2024/03/22',3);