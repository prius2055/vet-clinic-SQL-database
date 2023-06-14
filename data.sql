/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (001,'Agumon','2020-02-03',0,True,10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (002,'Gabumon','2018-11-15',2,True,8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (003,'Pikachu','2021-01-07',1,False,15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (004,'Devimon','2017-05-12',5,True,11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (005,'Charmander','2020-02-08',0,False,-11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (006,'Plantmon','2021-11-15',2,True,-5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (007,'Squirtle','1993-04-02',3,False,-12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (008,'Angemon','2005-06-12',1,True,-45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (009,'Boarmon','2005-06-7',7,True,20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (010,'Blossom','1998-10-13',3,True,17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (011,'Ditto','2022-05-14',4,True,22);

/* Populate owners table*/

INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34)
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell',19)
INSERT INTO owners (full_name,age) VALUES ('Bob',45)
INSERT INTO owners (full_name,age) VALUES ('Melody Pond',77)
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester',14)
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker',38)

/* Populate species table*/
INSERT INTO species (name) VALUES ('Pokemon')
INSERT INTO species (name) VALUES ('Digimon',38)


/* Modify your inserted animals so it includes the species_id */
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

/* Modify your inserted animals so it includes the owner_id */

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon';

/* Updating vets table*/
INSERT INTO vets(name,age,date_of_graduation) VALUES ('William Tatcher',45,'2000-04-23');

INSERT INTO vets(name,age,date_of_graduation) VALUES ('Maisy Smith',26,'2019-01-17');

INSERT INTO vets(name,age,date_of_graduation) VALUES ('Stephanie Mendez',64,'1981-05-04');

INSERT INTO vets(name,age,date_of_graduation) VALUES ('Jack Harkness',38,'2008-06-08');


/*Update specializations table*/
INSERT INTO specializations(species_id, vet_id)
SELECT species.id,vets.id
FROM species, vets
WHERE species.name = 'Pokemon' AND vets.name = 'William Tatcher';

INSERT INTO specializations(species_id, vet_id)
SELECT species.id,vets.id
FROM species, vets
WHERE species.name = 'Pokemon' AND vets.name = 'Stephanie Mendez';

INSERT INTO specializations(species_id, vet_id)
SELECT species.id,vets.id
FROM species, vets
WHERE species.name = 'Digimon' AND vets.name = 'Stephanie Mendez';

INSERT INTO specializations(species_id, vet_id)
SELECT species.id,vets.id
FROM species, vets
WHERE species.name = 'Digimon' AND vets.name = 'Jack Harkness';


/* Updating the visits table*/

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-05-24',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Agumon' AND vets.name = 'William Tatcher';
                         
INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-07-22',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Agumon' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2021-02-02',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Gabumon' AND vets.name = 'Jack Harkness';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-01-05',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-03-08',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-05-14',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2021-05-04',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Devimon' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits(visit_dates,animal_id, vets_id)
SELECT '2021-02-24',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Charmander' AND vets.name = 'Jack Harkness';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2019-12-21',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2020-08-10',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Plantmon' AND vets.name = 'William Tatcher';

INSERT INTO visits(visit_dates,animal_id, vet_id)
SELECT '2021-04-07',animals.id,vets.id
FROM animals, vets
WHERE animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2019-09-29',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Squirtle' AND vets.name = 'Stephanie Mendez';


INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2020-10-03',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Angemon' AND vets.name = 'Jack Harkness';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2020-11-04',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Angemon' AND vets.name = 'Jack Harkness';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2019-01-24',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2019-05-15',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2020-02-27',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2020-08-03',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2020-05-24',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Blossom' AND vets.name = 'Stephanie Mendez';

INSERT INTO visits(visit_dates,animal_id, vet_id)
 SELECT '2021-01-11',animals.id,vets.id
 FROM animals, vets
 WHERE animals.name = 'Blossom' AND vets.name = 'William Tatcher';



