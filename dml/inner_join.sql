Write an SQL query to display all devices along with all the parts that make them up.
We only want to display the name of the devices.
Its parts should only display the part_number.

SELECT d.name, p.part_number FROM devices AS d
JOIN parts as p ON p.device_id = d.id;
