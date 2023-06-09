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

/* Creating species table */
CREATE TABLE species (
id SERIAL PRIMARY KEY,
name TEXT
);

/* Creating owners table */
CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name TEXT,
age INTEGER
);



/* Modifying animals table */

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk2 FOREIGN KEY (owner_id) REFERENCES owners (id);


/* Create a table named vets */
 
CREATE TABLE vets(
id SERIAL PRIMARY KEY,
name TEXT,
age INTEGER,
date_of_graduation DATE
);

/* specializations table */
CREATE TABLE specializations(
species_id INTEGER, FOREIGN KEY(species_id) REFERENCES species(id),
vets_id INTEGER, FOREIGN KEY(vets_id) REFERENCES vets(id)
);

/* visits table */
CREATE TABLE visits(
visit_dates DATE NOT NULL,
animals_id INTEGER, FOREIGN KEY(animals_id) REFERENCES animals(id),
vets_id INTEGER, FOREIGN KEY(vets_id) REFERENCES vets(id)
);
