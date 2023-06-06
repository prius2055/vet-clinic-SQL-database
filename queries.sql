/*Queries that provide answers to the questions from all projects.*/

/* Query for all animals whose name ends in "mon" */
SELECT *
FROM animals
WHERE name LIKE '%mon';

/* Query for all animals born between 2016 and 2019. */
SELECT * FROM animals
WHERE date_of_birth 
BETWEEN '2016-01-01' AND '2019-01-01';

/* Query for all neutered animals with less than 3 escape attempts */
SELECT * FROM animals
WHERE neutered = true AND escape_attempts < 3;

/* Query date of birth for animals with name PIKACHU or AGUMON */
SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name = 'Pikachu';

/* Query name and escapt attempts for weight > 10.5Kg */
SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

/* Query all Neutered animals */
SELECT * FROM animals
WHERE neutered = true;

/* Query all animals with name NOT Gabumon */
SELECT * FROM animals
WHERE NOT name = 'Gabumon';

/* Query all animals with >=10.4 and <= 17.3 */
SELECT * FROM animals
WHERE weight_kg >=10.4 AND weight_kg <= 17.3;


/* TRANSACTION 1 */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals
ROLLBACK;
SELECT * FROM animals;

/* TRANSACTION 2 */
BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokeman'
WHERE species = '';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* TRANSACTION 3 */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* TRANSACTION 4 */
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

/* How many animals are there? */
SELECT COUNT (*) FROM animals;

/* How many animals have never tried to escape? */
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals?*/
SELECT AVG(weight_kg) FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
 SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth
BETWEEN '1990-01-01' AND '2000-01-31'
GROUP BY species;












