USE littlelemondb;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
IF EXISTS(SELECT * FROM orders WHERE order_id = id)
THEN
DELETE FROM orders WHERE order_id = id; 
SELECT CONCAT("Order ", id, " is cancelled") AS Confirmation;
ELSE
SELECT CONCAT("Error!!! Order ", id, " does not exist") AS Error;
END IF;
END //
DELIMITER ;

SET @id = 	1;
CALL CancelOrder(@id);