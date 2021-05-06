Write an SQL statement that will associate the last two parts from our parts
table with an "Accelerometer" instead of a "Gyroscope".

UPDATE parts
  SET device_id = 1
  WHERE id = 7 OR id = 8;


UPDATE parts
  SET device_id = 2
  WHERE part_number = (SELECT MIN(part_number) FROM parts);
