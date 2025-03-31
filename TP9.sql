DROP DATABASE IF EXISTS site;
CREATE DATABASE site CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE site;

CREATE TABLE client (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100),
  CONSTRAINT pk_client PRIMARY KEY  pk_client(id)
)ENGINE=INNODB;

CREATE TABLE commande (
  id INT NOT NULL AUTO_INCREMENT,
  date_achat DATETIME NOT NULL,
  client_id int NOT NULL,
  CONSTRAINT pk_commande PRIMARY KEY  pk_commande(id)
)ENGINE=INNODB;

CREATE TABLE article (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  prix float NOT NULL,
   CONSTRAINT pk_article PRIMARY KEY  pk_article(id)
)ENGINE=INNODB;

CREATE TABLE ligne (
  article_id int NOT NULL,
  commande_id int NOT NULL,
  nombre int NOT NULL,
  prix float NOT NULL,
  CONSTRAINT pk_ligne PRIMARY KEY (article_id, commande_id)
)ENGINE=INNODB;

ALTER TABLE commande ADD CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client(id);
ALTER TABLE ligne ADD CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES article(id);
ALTER TABLE ligne ADD CONSTRAINT fk_commande FOREIGN KEY (commande_id) REFERENCES commande(id);

INSERT INTO article (nom,prix) VALUES
('PlayStation 5',	500),
('X box',	350),
('Machine à café',	400),
('PlayStation 3',	100);

INSERT INTO client (prenom,nom) VALUES
('Brad','PITT'),	
('George','CLONEY'),
('Jean','DUJARDIN');

INSERT INTO commande (date_achat,client_id) VALUES('2024-09-08 10:15:00',1);

INSERT INTO ligne (article_id,commande_id,nombre,prix) VALUES
(4,1,2,100),
(3,1,1,300),
(2,1,1,350);

SELECT 
client.prenom AS prenom,
client.nom AS nom,
commande.date_achat AS date_achat,
article.nom AS nom,
ligne.prix AS prix,
ligne.nombre AS nb,
ligne.prix * ligne.nombre AS total
FROM commande
INNER JOIN ligne ON commande.id = ligne.commande_id
INNER JOIN article ON article_id = article.id
INNER JOIN client ON client.id = commande.client_id
WHERE commande_id = 1;

SELECT 
	SUM(ligne.prix*ligne.nombre) AS total_ht,
	SUM(ligne.prix*ligne.nombre*0.2) AS total_tva,
	SUM(ligne.prix*ligne.nombre*1.2) AS total_ttc
FROM commande
INNER JOIN ligne ON commande.id = ligne.commande_id
WHERE commande_id=1;