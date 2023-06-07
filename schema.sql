/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL 
);

/* Adding a column 'species' to the aninals table*/
ALTER TABLE animals ADD species varchar(20);

/* Creating owners table */
vet_clinic=# CREATE TABLE owners (
vet_clinic(# id SERIAL PRIMARY KEY,
vet_clinic(# full_name TEXT,
vet_clinic(# age INTEGER
vet_clinic(# );
CREATE TABLE
vet_clinic=# CREATE TABLE species (
vet_clinic(# id SERIAL PRIMARY KEY,
vet_clinic(# name TEXT
vet_clinic(# );
CREATE TABLE

/* Creating species table */
CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name TEXT,
age INTEGER
);

CREATE TABLE species (
id SERIAL PRIMARY KEY,
name TEXT
);


/* Modifying animals table */

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk2 FOREIGN KEY (owner_id) REFERENCES owners (id);

