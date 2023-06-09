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

/*What animals belong to Melody Pond?*/
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon).*/
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

/*List all owners and their animals, remember to include those that don't own any animal.*/
SELECT animals.name, owners.full_name
FROM animals
RIGHT JOIN owners ON animals.owner_id = owners.id;

/* How many animals are there per species? */
SELECT species.name, COUNT(*) AS animalsCount
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/* Who owns the most animals? */
SELECT owners.full_name, COUNT(*) AS animalCount
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animalCount DESC
LIMIT 1;

/* Who was the last animal seen by William Tatcher? */
vet_clinic=# SELECT animals.name FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# WHERE vets.name = 'William Tatcher'
vet_clinic-# ORDER BY visits.visit_dates DESC
vet_clinic-# LIMIT 1;


/* How many different animals did Stephanie Mendez see? */
vet_clinic=# SELECT COUNT(DISTINCT animals.name) AS distinct_animal_count
vet_clinic-# FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# WHERE vets.name = 'Stephanie Mendez';
 distinct_animal_count

/* List all vets and their specialties, including vets with no specialties. */
vet_clinic=# SELECT species.name,vets.name FROM species
vet_clinic-# JOIN specializations ON specializations.species_id = species.id
vet_clinic-# RIGHT JOIN vets ON specializations.vets_id = vets.id;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/
vet_clinic=# SELECT animals.name FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# WHERE vets.name = 'Stephanie Mendez' AND visits.visit_dates
vet_clinic-# BETWEEN '2020-04-01' AND '2020-08-30';

/*What animal has the most visits to vets?*/
vet_clinic=# SELECT animals.name, COUNT(visits.visit_dates) AS number_of_visits
vet_clinic-# FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# GROUP BY animals.name
vet_clinic-# ORDER BY number_of_visits DESC

/* Who was Maisy Smith's first visit? */
vet_clinic=# SELECT animals.name FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# WHERE vets.name = 'Maisy Smith'
vet_clinic-# ORDER BY visits.visit_dates ASC
vet_clinic-# LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
vet_clinic=# SELECT animals.name,vets.name,visits.visit_dates FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# ORDER BY visits.visit_dates DESC
vet_clinic-# LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species?*/
vet_clinic=# SELECT COUNT(*) AS visit_count FROM species
vet_clinic-# JOIN specializations ON species.id = specializations.species_id
vet_clinic-# JOIN vets ON specializations.vets_id = vets.id
vet_clinic-# JOIN visits ON vets.id = visits.vets_id
vet_clinic-# JOIN animals ON visits.animals_id = animals.id
vet_clinic-# WHERE species.id <> specializations.species_id;


/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
vet_clinic=# SELECT animals.name, COUNT(visits.visit_dates) As num_of_visits
vet_clinic-# FROM animals
vet_clinic-# JOIN visits ON animals.id = visits.animals_id
vet_clinic-# JOIN vets ON visits.vets_id = vets.id
vet_clinic-# WHERE vets.name = 'Maisy Smith'
vet_clinic-# GROUP BY animals.name
vet_clinic-# ORDER BY num_of_visits DESC
vet_clinic-# LIMIT 1;




















