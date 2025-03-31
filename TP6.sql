
# 1 Création de la base de données
DROP DATABASE IF EXISTS netflix;
CREATE DATABASE netflix CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE netflix;

# 2 table film
CREATE TABLE film (
    id INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    sortie DATE NOT NULL,
    categ_id INT NULL,
    CONSTRAINT pk_film PRIMARY KEY(id)
) ENGINE=InnoDB; 

# 3 table categ
CREATE TABLE categ (
 id int NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 CONSTRAINT pk_categ PRIMARY KEY (id)
)ENGINE=INNODB;

ALTER TABLE film ADD CONSTRAINT fk_categ FOREIGN KEY (categ_id) REFERENCES categ(id);

INSERT INTO categ (nom) VALUES
('Science fiction'),
('Thriller');

INSERT INTO film (titre,sortie,categ_id) VALUES
('STAR WARS','1977/05/25',1),
('THE MATRIX','1999/06/23',1),
('PULP FICTION','1994/10/26',2);

SELECT film.id, film.titre, film.sortie, categ.nom FROM film
INNER JOIN categ ON film.categ_id = categ.id
WHERE categ.nom = 'Science fiction';

SELECT COUNT(*) FROM film
INNER JOIN categ ON film.categ_id = categ.id
WHERE categ.nom = 'Science fiction';

SELECT COUNT(*) FROM film
INNER JOIN categ ON film.categ_id = categ.id
WHERE categ.nom = 'Science fiction';

SELECT categ.nom, COUNT(film.id) FROM categ
LEFT JOIN film ON film.categ_id = categ.id
GROUP BY categ.nom;
