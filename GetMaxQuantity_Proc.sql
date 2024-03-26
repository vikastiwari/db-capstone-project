USE littlelemondb;

DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT quantity as `Max Quantity in Order` FROM Orders
ORDER BY quantity DESC
LIMIT 1;
END //
DELIMITER ;

CALL GetMaxQuantity();