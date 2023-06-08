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

