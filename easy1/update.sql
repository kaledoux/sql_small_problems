UPDATE birds
  SET species = 'Raven'
  WHERE species = 'Crow';

UPDATE birds
  SET species = 'Hawk'
  WHERE species = 'Owl' AND name = 'Jamie';
