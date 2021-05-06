Our workshop has decided to not make an Accelerometer after all. Delete any data
related to "Accelerometer", this includes the parts associated with an Accelerometer.

ALTER TABLE parts
  DROP CONSTRAINT parts_device_id_fkey;

ALTER TABLE parts
  ADD FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE;

DELETE FROM devices
  WHERE name = 'Accelerometer';
