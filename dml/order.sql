SELECT d.name, COUNT(p.id) AS number_of_parts FROM devices AS d
LEFT OUTER JOIN parts AS p ON p.device_id = d.id
GROUP BY d.id
ORDER BY d.name ASC;
