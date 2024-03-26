USE littlelemondb;

SELECT name as MenuName FROM menu as m JOIN Orders as o ON m.menu_id = o.menu_id WHERE order_id = ANY (SELECT order_id FROM Orders WHERE quantity > 2);