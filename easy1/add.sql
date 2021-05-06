ALTER TABLE birds
  ADD CONSTRAINT check_age
  CHECK(age>0);

INSERT INTO birds VALUES
  (6, 'Sammy', -8, 'Toucan');
