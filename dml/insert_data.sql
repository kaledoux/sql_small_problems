Now that we have the infrastructure for our workshop set up,
let's start adding in some data. Add in two different devices.
One should be named, "Accelerometer". The other should be named, "Gyroscope".

The first device should have 3 parts (this is grossly simplified).
The second device should have 5 parts. The part numbers may be any number
between 1 and 10000. There should also be 3 parts that don't belong to any device yet.

INSERT INTO devices(name) VALUES
  ('Accelerometer'),
  ('Gyroscope');

INSERT INTO parts(part_number, device_id) VALUES
  (101, 1),
  (102, 1),
  (103, 1),
  (104, 1),
  (105, 1),
  (200, 2),
  (201, 2),
  (202, 2),
  (300, NULL),
  (301, NULL),
  (302, NULL);
