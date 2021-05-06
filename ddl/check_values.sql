The spectral_type column in the stars table is currently defined as a one-character
string that contains one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'.
However, there is currently no enforcement on the values that may be entered.
Add a constraint to the table stars that will enforce the requirement that a row must
hold one of the 7 listed values above.
Also, make sure that a value is required for this column.

ALTER TABLE stars
  ADD CONSTRAINT valid_spectral_type
  CHECK(spectral_type ~ '[OBAFGKM]');

ALTER TABLE stars
  ALTER COLUMN spectral_type SET NOT NULL;

Assume the stars table contains one or more rows that are missing a spectral_type value,
or that have an illegal value. What will happen when you try to alter the table
schema? How would you go about adjusting the data to work around this problem.
To test this, revert the modification and add some data:

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check,
ALTER COLUMN spectral_type DROP NOT NULL;

INSERT INTO stars (name, distance, companions)
           VALUES ('Epsilon Eridani', 10.5, 0);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, 'X', 0);

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

You can either delete the rows before adding the constraints, or you can use
the NOT VALID keywords to allow the constraints to be applied, bypassing invalid
entries already present in the DB.
