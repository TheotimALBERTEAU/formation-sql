DROP DATABASE IF EXISTS location_ski;
CREATE DATABASE location_ski CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE location_ski;

CREATE TABLE clients(
	noCli INT AUTO_INCREMENT NOT NULL,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30),
    adresse VARCHAR(120),
    cpo VARCHAR(5) NOT NULL,
    ville VARCHAR(80) NOT NULL,
    CONSTRAINT pk_clients PRIMARY KEY (noCli)
)ENGINE = INNODB;

CREATE TABLE fiches(
	noFic INT AUTO_INCREMENT NOT NULL,
    noCli INT NOT NULL,
    dateCrea DATE NOT NULL,
    datePaiement DATE,
    etat ENUM('EC', 'SO'),
    CONSTRAINT pk_fiches PRIMARY KEY (noFic)
)ENGINE = INNODB;

CREATE TABLE lignesFic(
	noLig INT AUTO_INCREMENT NOT NULL,
    noFic INT NOT NULL,
    refart CHAR(8) NOT NULL,
    depart DATE NOT NULL,
    retour DATE,
    CONSTRAINT pk_lignesfic PRIMARY KEY (noLig, noFic)
)ENGINE = INNODB;

CREATE TABLE articles(
	refart CHAR(8) NOT NULL,
    designation VARCHAR(80) NOT NULL,
    codeGam CHAR(5),
    codeCate CHAR(5),
    CONSTRAINT pk_articles PRIMARY KEY (refart)
)ENGINE = INNODB;

CREATE TABLE categories(
	codeCate CHAR(5) NOT NULL,
    libelle VARCHAR(30) NOT NULL,
    CONSTRAINT pk_categories PRIMARY KEY (codeCate)
)ENGINE = INNODB;

CREATE TABLE gammes(
	codeGam CHAR(5) NOT NULL,
    libelle VARCHAR(45) NOT NULL,
    CONSTRAINT pk_gammes PRIMARY KEY (codeGam)
)ENGINE = INNODB;

CREATE TABLE grilleTarifs(
	codeGam CHAR(5) NOT NULL,
    codeCate CHAR(5) NOT NULL,
    codeTarif CHAR(5),
    CONSTRAINT pk_grilletarifs PRIMARY KEY (codeGam, codeCate)
)ENGINE = INNODB;

CREATE TABLE tarifs(
	codeTarif CHAR(5) NOT NULL,
    libelle CHAR(30) NOT NULL,
    prixjour DECIMAL(5,0) NOT NULL,
    CONSTRAINT pk_tarifs PRIMARY KEY (codeTarif)
)ENGINE = INNODB;

INSERT INTO clients (noCli, nom, prenom, adresse, cpo, ville) VALUES 
    (1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens'),
    (2, 'Bernard', 'Barnabé', 'Rue du bar', '1000', 'Bourg en Bresse'),
    (3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', 'Nantes'),
    (4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
     (5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne'),
    (6, 'Ferdinand', 'François', 'Rue de la convention', '44100', 'Nantes'),
    (9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris'),
    (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

INSERT INTO fiches (noFic, noCli, dateCrea, datePaiement, etat) VALUES 
    (1001, 14,  DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY),'SO' ),
    (1002, 4,  DATE_SUB(NOW(),INTERVAL  13 DAY), NULL, 'EC'),
    (1003, 1,  DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY),'SO'),
    (1004, 6,  DATE_SUB(NOW(),INTERVAL  11 DAY), NULL, 'EC'),
    (1005, 3,  DATE_SUB(NOW(),INTERVAL  10 DAY), NULL, 'EC'),
    (1006, 9,  DATE_SUB(NOW(),INTERVAL  10 DAY),NULL ,'RE'),
    (1007, 1,  DATE_SUB(NOW(),INTERVAL  3 DAY), NULL, 'EC'),
    (1008, 2,  DATE_SUB(NOW(),INTERVAL  0 DAY), NULL, 'EC');

INSERT INTO tarifs (codeTarif, libelle, prixJour) VALUES
    ('T1', 'Base', 10),
    ('T2', 'Chocolat', 15),
    ('T3', 'Bronze', 20),
    ('T4', 'Argent', 30),
    ('T5', 'Or', 50),
    ('T6', 'Platine', 90);

INSERT INTO gammes (codeGam, libelle) VALUES
    ('PR', 'Matériel Professionnel'),
    ('HG', 'Haut de gamme'),
    ('MG', 'Moyenne gamme'),
    ('EG', 'Entrée de gamme');

INSERT INTO categories (codeCate, libelle) VALUES
    ('MONO', 'Monoski'),
    ('SURF', 'Surf'),
    ('PA', 'Patinette'),
    ('FOA', 'Ski de fond alternatif'),
    ('FOP', 'Ski de fond patineur'),
    ('SA', 'Ski alpin');

INSERT INTO grilleTarifs (codeGam, codeCate, codeTarif) VALUES
    ('EG', 'MONO', 'T1'),
    ('MG', 'MONO', 'T2'),
    ('EG', 'SURF', 'T1'),
    ('MG', 'SURF', 'T2'),
    ('HG', 'SURF', 'T3'),
    ('PR', 'SURF', 'T5'),
    ('EG', 'PA', 'T1'),
    ('MG', 'PA', 'T2'),
    ('EG', 'FOA', 'T1'),
    ('MG', 'FOA', 'T2'),
    ('HG', 'FOA', 'T4'),
    ('PR', 'FOA', 'T6'),
    ('EG', 'FOP', 'T2'),
    ('MG', 'FOP', 'T3'),
    ('HG', 'FOP', 'T4'),
    ('PR', 'FOP', 'T6'),
    ('EG', 'SA', 'T1'),
    ('MG', 'SA', 'T2'),
    ('HG', 'SA', 'T4'),
    ('PR', 'SA', 'T6');

INSERT INTO articles (refart, designation, codeGam, codeCate) VALUES 
    ('F01', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F02', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F03', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F04', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F05', 'Fischer Cruiser', 'EG', 'FOA'),
    ('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
    ('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
    ('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP'),
    ('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
    ('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
    ('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
    ('S01', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S02', 'Décathlon Apparition', 'EG', 'SURF'),
    ('S03', 'Décathlon Apparition', 'EG', 'SURF'),
    ('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
    ('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
    ('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

INSERT INTO lignesFic (noFic, noLig,  refart, depart, retour) VALUES 
    (1001, 1, 'F05', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1001, 2, 'F50', DATE_SUB(NOW(),INTERVAL  15 DAY), DATE_SUB(NOW(),INTERVAL  14 DAY)),
    (1001, 3, 'F60', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  13 DAY)),
    (1002, 1, 'A03', DATE_SUB(NOW(),INTERVAL  13 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1002, 2, 'A04', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  7 DAY)),
    (1002, 3, 'S03', DATE_SUB(NOW(),INTERVAL  8 DAY), NULL),
    (1003, 1, 'F50', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1003, 2, 'F05', DATE_SUB(NOW(),INTERVAL  12 DAY), DATE_SUB(NOW(),INTERVAL  10 DAY)),
    (1004, 1, 'P01', DATE_SUB(NOW(),INTERVAL  6 DAY), NULL),
    (1005, 1, 'F05', DATE_SUB(NOW(),INTERVAL  9 DAY), DATE_SUB(NOW(),INTERVAL  5 DAY)),
    (1005, 2, 'F10', DATE_SUB(NOW(),INTERVAL  4 DAY), NULL),
    (1006, 1, 'S01', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 2, 'S02', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1006, 3, 'S03', DATE_SUB(NOW(),INTERVAL  10 DAY), DATE_SUB(NOW(),INTERVAL  9 DAY)),
    (1007, 1, 'F50', DATE_SUB(NOW(),INTERVAL  3 DAY), DATE_SUB(NOW(),INTERVAL  2 DAY)),
    (1007, 3, 'F60', DATE_SUB(NOW(),INTERVAL  1 DAY), NULL),
    (1007, 2, 'F05', DATE_SUB(NOW(),INTERVAL  3 DAY), NULL),
    (1007, 4, 'S02', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL),
    (1008, 1, 'S01', DATE_SUB(NOW(),INTERVAL  0 DAY), NULL);
    
ALTER TABLE fiches ADD CONSTRAINT fk_nocli FOREIGN KEY (noCli) REFERENCES clients(noCli);
ALTER TABLE lignesFic ADD CONSTRAINT fk_nofic FOREIGN KEY (noFic) REFERENCES fiches(noFic);
ALTER TABLE lignesFic ADD CONSTRAINT fk_refart FOREIGN KEY (refart) REFERENCES articles(refart);
ALTER TABLE articles ADD CONSTRAINT fk_codegam FOREIGN KEY (codeGam) REFERENCES gammes(codeGam);
ALTER TABLE articles ADD CONSTRAINT fk_codecate FOREIGN KEY (codeCate) REFERENCES categories(codeCate);
ALTER TABLE grilleTarifs ADD CONSTRAINT fk_codegamtarif FOREIGN KEY (codeGam) REFERENCES gammes(codeGam);
ALTER TABLE grilleTarifs ADD CONSTRAINT fk_codecatetarif FOREIGN KEY (codeCate) REFERENCES categories(codeCate);
ALTER TABLE grilleTarifs ADD CONSTRAINT fk_codetarif FOREIGN KEY (codeTarif) REFERENCES tarifs(codeTarif);

-- Question 1 --
SELECT *
FROM clients
WHERE nom LIKE 'd%';

-- Question 2 --
SELECT
nom AS nom,
prenom AS prenom
FROM clients;

-- Question 3 --
SELECT 
fiches.noFic AS noFic,
fiches.etat AS etat,
clients.nom AS nom,
clients.prenom AS prenom
FROM fiches
INNER JOIN clients ON clients.noCli = fiches.noCli
LEFT JOIN lignesFic ON fiches.noFic = lignesFic.noFic
WHERE clients.cpo LIKE '44%'
GROUP BY fiches.noFic, fiches.etat, clients.nom, clients.prenom;

-- Question 4 --
SELECT
fiches.noFic AS noFic,
clients.nom AS nom,
clients.prenom AS prenom,
articles.refart AS refart,
articles.designation AS designation,
lignesFic.depart AS depart,
lignesFic.retour AS retour,
tarifs.prixjour AS prixJour,
(IFNULL(DATEDIFF(IFNULL(lignesFic.retour, NOW()), lignesFic.depart), 0) + 1) * tarifs.prixjour AS montant
FROM fiches
INNER JOIN lignesFic ON fiches.noFic = lignesFic.noFic
INNER JOIN articles ON lignesFic.refart = articles.refart
INNER JOIN categories ON articles.codeCate = categories.codeCate
INNER JOIN gammes ON articles.codeGam = gammes.codeGam
INNER JOIN grilleTarifs ON grilleTarifs.codeGam = gammes.codeGam AND grilleTarifs.codeCate = categories.codeCate
INNER JOIN tarifs ON grilleTarifs.codeTarif = tarifs.codeTarif
INNER JOIN clients ON fiches.noCli = clients.noCli
WHERE fiches.noFic = 1002;

-- Question 5 --
SELECT 
gammes.libelle AS Gamme,
AVG(tarifs.prixjour) AS tarif_journalier_moyen
FROM articles
INNER JOIN gammes ON articles.codeGam = gammes.codeGam
INNER JOIN grilleTarifs ON articles.codeGam = grilletarifs.codeGam AND articles.codeCate = grilletarifs.codeCate
INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif
GROUP BY gammes.libelle;

-- Question 6 --
SELECT
    fiches.noFic AS numeroFiche,
    clients.nom AS nomClient,
    clients.prenom AS prenomClient,
    articles.refart AS referenceArticle,
    articles.designation AS designationArticle,
    lignesFic.depart AS dateDepart,
    lignesFic.retour AS dateRetour,
    tarifs.prixjour AS prixJournalier,
    (IFNULL(DATEDIFF(IFNULL(lignesFic.retour, NOW()), lignesFic.depart), 0) + 1) * tarifs.prixjour AS montant,
    (SELECT SUM((IFNULL(DATEDIFF(IFNULL(lignesFicSous.retour, NOW()), lignesFicSous.depart), 0) + 1) * tarifsSous.prixjour)
     FROM lignesFic AS lignesFicSous
     INNER JOIN articles AS articlesSous ON lignesFicSous.refart = articlesSous.refart
     INNER JOIN categories AS categoriesSous ON articlesSous.codeCate = categoriesSous.codeCate
     INNER JOIN gammes AS gammesSous ON articlesSous.codeGam = gammesSous.codeGam
     INNER JOIN grilleTarifs AS grilleTarifsSous ON grilleTarifsSous.codeGam = gammesSous.codeGam 
                                                  AND grilleTarifsSous.codeCate = categoriesSous.codeCate
     INNER JOIN tarifs AS tarifsSous ON grilleTarifsSous.codeTarif = tarifsSous.codeTarif
     WHERE lignesFicSous.noFic = fiches.noFic) AS total
FROM fiches
INNER JOIN lignesFic ON fiches.noFic = lignesFic.noFic
INNER JOIN articles ON lignesFic.refart = articles.refart
INNER JOIN categories ON articles.codeCate = categories.codeCate
INNER JOIN gammes ON articles.codeGam = gammes.codeGam
INNER JOIN grilleTarifs ON grilleTarifs.codeGam = gammes.codeGam 
                         AND grilleTarifs.codeCate = categories.codeCate
INNER JOIN tarifs ON grilleTarifs.codeTarif = tarifs.codeTarif
INNER JOIN clients ON fiches.noCli = clients.noCli
WHERE fiches.noFic = 1002;

-- Question 7 --
SELECT 
categories.libelle AS libelle,
tarifs.libelle AS libelle,
gammes.libelle AS libelle,
tarifs.prixjour AS prixJour 
FROM tarifs 
JOIN grilleTarifs ON grilleTarifs.codeTarif=tarifs.codeTarif
JOIN gammes ON gammes.codeGam=grilleTarifs.codeGam
JOIN categories ON categories.codeCate=grilletarifs.codeCate;

-- Question 8 --
SELECT 
articles.refart AS refart,
articles.designation AS designation,
COUNT(lignesFic.noFic) AS nbLocation
FROM articles
JOIN lignesFic ON lignesFic.refart=articles.refart
JOIN categories ON categories.codeCate=articles.codeCate
where categories.libelle="surf"
GROUP BY articles.refart;

-- Question 9 --
SELECT 
    AVG(nombre_articles) AS moyenne_articles_par_fiche
FROM (
    SELECT 
        noFic, 
        COUNT(*) AS nombre_articles
    FROM lignesFic
    GROUP BY noFic
) AS sous_requete;

-- Question 10 --
SELECT 
categories.libelle AS libelle,
COUNT(lignesFic.noFic) AS nombre_de_location
FROM categories
JOIN articles ON categories.codeCate=articles.codeCate
JOIN lignesFic ON lignesFic.refart=articles.refart
where categories.libelle IN ("ski alpin","surf","Patinette")
GROUP BY categories.libelle

-- Question 11 --
SELECT 
    AVG(montant_total) AS montant_moyen_par_fiche
FROM (
    SELECT 
        fiches.noFic,
        SUM(
            (IFNULL(DATEDIFF(IFNULL(lignesFic.retour, NOW()), lignesFic.depart), 0) + 1) * tarifs.prixjour
        ) AS montant_total
    FROM fiches
    INNER JOIN lignesFic ON fiches.noFic = lignesFic.noFic
    INNER JOIN articles ON lignesFic.refart = articles.refart
    INNER JOIN grilleTarifs ON articles.codeGam = grilleTarifs.codeGam AND articles.codeCate = grilleTarifs.codeCate
    INNER JOIN tarifs ON grilleTarifs.codeTarif = tarifs.codeTarif
    GROUP BY fiches.noFic
) AS sous_requete;
