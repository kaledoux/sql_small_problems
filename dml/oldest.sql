Insert one more device into the devices table.
You may use this SQL statement or create your own.

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

SELECT * FROM devices
  ORDER BY created_at
  LIMIT 1;
