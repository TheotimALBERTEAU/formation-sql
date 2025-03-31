# 1 Création de la base de données spa
DROP DATABASE IF EXISTS spa;
-- CREATION DE LA DATA BASE
CREATE DATABASE spa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE spa;

# 2 Création de la table chat  
CREATE TABLE chat (
 id int NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 age INT NOT NULL,
 couleur_id int NULL, # le champ peut etre null
 CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

# 3 Creation de la table couleur 
CREATE TABLE couleur (
 id int NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=INNODB;

ALTER TABLE chat ADD CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id);

# 4 on commence par la table couleur
INSERT INTO couleur (nom) VALUES
('marron'),
('bleu'),
('vert');

# 5 ensuite la table chat
INSERT INTO chat (nom,age,couleur_id) VALUES
('maine coon',20,1),
('siamois',15,2),
('bengal',18,1),
('scottish fold',10,1),
('domestique',21,null);

# id	nom	yeux	age
SELECT
chat.id AS id,
chat.nom AS nom,
 COALESCE(couleur.nom,'PAS DE COULEUR') AS yeux,
chat.age AS age
FROM chat
LEFT JOIN couleur
ON chat.couleur_id = couleur.id