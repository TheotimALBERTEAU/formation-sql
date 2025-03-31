DROP DATABASE IF EXISTS prime_vdo;
CREATE DATABASE prime_vdo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE prime_vdo;

CREATE TABLE film (
  id INT  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_film PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE acteur (
  id INT NOT NULL AUTO_INCREMENT,
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
   CONSTRAINT pk_acteur PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE film_has_acteur (
  film_id INT NOT NULL,
  acteur_id INT NOT NULL,
  CONSTRAINT pk_film_has_acteur PRIMARY KEY (film_id, acteur_id)
)ENGINE=INNODB;

ALTER TABLE film_has_acteur ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES acteur (id);
ALTER TABLE film_has_acteur ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film (id);

##############
## Les données
##############

INSERT INTO acteur (id, prenom, nom) VALUES
(1, 'Brad', 'PITT'),
(2, 'Léonardo', 'Dicaprio');

INSERT INTO film (id, nom) VALUES
(1, 'Fight Club'),
(2, 'Once Upon a time in Hollywood');

INSERT INTO film_has_acteur 
(film_id, acteur_id) 
VALUES 
('1', '1'), 
('2', '1'), 
('2', '2');

SELECT film.nom, acteur.prenom, acteur.nom
FROM film
INNER JOIN film_has_acteur ON film.id = film_has_acteur.film_id
INNER JOIN acteur ON film_has_acteur.acteur_id = acteur.id
WHERE acteur.prenom = 'Brad' AND acteur.nom = 'PITT';

SELECT acteur.prenom, acteur.nom, COUNT(film_has_acteur.film_id)
FROM acteur
LEFT JOIN film_has_acteur ON acteur.id = film_has_acteur.acteur_id
GROUP BY acteur.id, acteur.prenom, acteur.nom;

INSERT INTO film (nom) VALUES ('TITANIC');

SELECT film.nom
FROM film
LEFT JOIN film_has_acteur ON film.id = film_has_acteur.film_id
WHERE film_has_acteur.film_id IS NULL;

INSERT INTO film_has_acteur (film_id, acteur_id)
SELECT film.id, acteur.id 
FROM film, acteur
WHERE film.nom = 'TITANIC' 
AND acteur.prenom = 'Leonardo' 
AND acteur.nom = 'Dicaprio';

SELECT film.nom, acteur.prenom, acteur.nom
FROM film
INNER JOIN film_has_acteur ON film.id = film_has_acteur.film_id
INNER JOIN acteur ON film_has_acteur.acteur_id = acteur.id
ORDER BY film.nom;

INSERT INTO acteur (prenom, nom) VALUES ('TOM', 'CRUISE');

SELECT acteur.prenom, acteur.nom, COUNT(film_has_acteur.film_id)
FROM acteur
LEFT JOIN film_has_acteur ON acteur.id = film_has_acteur.acteur_id
GROUP BY acteur.id, acteur.prenom, acteur.nom;

SELECT acteur.prenom, acteur.nom, COUNT(film_has_acteur.film_id)
FROM acteur
INNER JOIN film_has_acteur ON acteur.id = film_has_acteur.acteur_id
GROUP BY acteur.id, acteur.prenom, acteur.nom
HAVING COUNT(film_has_acteur.film_id) = 2;

SELECT ROUND(COUNT(film_has_acteur.acteur_id) / COUNT(DISTINCT film.id), 4)
FROM film
LEFT JOIN film_has_acteur ON film.id = film_has_acteur.film_id;

DROP TABLE IF EXISTS film_has_acteur;
DROP TABLE IF EXISTS acteur;
DROP TABLE IF EXISTS film;
