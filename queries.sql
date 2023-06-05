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

