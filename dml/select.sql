We want to grab all parts that have a part_number that starts with 3. Write a SELECT
query to get this information. This table may show all attributes of the parts table.

SELECT * FROM parts
  WHERE CAST(part_number AS TEXT) ~ '^3.*';
