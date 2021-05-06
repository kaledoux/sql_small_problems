SELECT DISTINCT c.* FROM customers AS c
JOIN customers_services as cs ON cs.customer_id = c.id
ORDER BY c.id;
