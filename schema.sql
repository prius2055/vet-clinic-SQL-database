/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL 
);
