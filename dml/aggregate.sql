Write an SQL query that returns a result table with the name of each device in
our database together with the number of parts for that device.

SELECT d.name, COUNT(p.id) AS number_of_parts FROM devices AS d
LEFT OUTER JOIN parts AS p ON p.device_id = d.id
GROUP BY d.id;
