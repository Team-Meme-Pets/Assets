--postgreSQL for MemePet project.

CREATE TABLE UserAccount(
username VARCHAR(20) NOT NULL,
password VARCHAR(256) NOT NULL,
email VARCHAR(30),
created_on TIMESTAMP NOT NULL,
last_login TIMESTAMP,
PRIMARY KEY (`username`)
);

CREATE TABLE PetModel(
pet_name VARCHAR(20) UNIQUE NOT NULL,
import_on TIMESTAMP NOT NULL,
PRIMARY KEY (`pet_name`)
);

CREATE TABLE HavePet(
username VARCHAR(20) NOT NULL,
pet_name VARCHAR(20) NOT NULL,
PRIMARY KEY(username, pet_name),
FOREIGN KEY(pet_name) REFERENCES PetModel(pet_name) ON DELETE CASCADE,
FOREIGN KEY(username) REFERENCES UserAccount(username) ON DELETE CASCADE
);

CREATE TABLE Location(
username VARCHAR(20) NOT NULL,
latitude numeric(9,6),
longitude numeric(9,6),
PRIMARY KEY(username)
FOREIGN KEY(username) REFERENCES UserAccount(username) ON DELETE CASCADE
);
