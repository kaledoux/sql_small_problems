Hmm... it turns out that 25 characters isn't enough room to store a star's complete name.
For instance, the star "Epsilon Trianguli Australis A" requires 30 characters.
Modify the column so that it allows star names as long as 50 characters.

ALTER TABLE stars
  ALTER COLUMN name TYPE varchar(50);

a
Assume the stars table already contains one or more rows of data.
What will happen when you try to run the above command?
To test this, revert the modification and add a row or two of data:

It will throw an error because there are already existing values in those columns


ALTER TABLE stars
ALTER COLUMN name TYPE varchar(25);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

It does not throw an error making this change, as the data type is similar and can
be 'cast automatically' into the new data type. For this reason, we can change
the data type between text, varchar and char, but receive an error when trying to
switch to a different type altogether, like integer.
