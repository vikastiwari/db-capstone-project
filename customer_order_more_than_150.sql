USE littlelemondb;

SELECT c.customer_id as CustomerID, c.name as FullName, o.order_id as OrderID, o.total_cost as Cost, m.name as MenuName
FROM customer_details as c JOIN Orders as o ON c.customer_id = o.customer_id JOIN menu as m ON o.menu_id = m.menu_id
WHERE o.total_cost > 150 ORDER BY o.total_cost ASC;