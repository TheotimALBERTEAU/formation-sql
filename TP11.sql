DROP DATABASE IF EXISTS location_ski2;
CREATE DATABASE location_ski2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE location_ski2;

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
(14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris'),
(20, 'Dubosc', 'Frank', '12 avenue des flots bleus', '76140', 'Petit-Quevilly'),
(21, 'Boon', 'Dany', '22 rue des Ch''tis', '59280', 'Armentières'),
(22, 'Elmaleh', 'Gad', '45 rue du sentier', '75001', 'Paris'),
(23, 'Dujardin', 'Jean', 'rue Brice', '92500', 'Rueil-Malmaison'),
(24, 'Marceau', 'Sophie', 'Boulevard de la Boom', '75010', 'Paris'),
(25, 'Merad', 'Kad', 'Rue du petit nicolas', '91130', 'Ris-Orangis'),
(26, 'Seigner', 'Mathilde', '357 rue du Camping', '75012', 'Paris'),
(27, 'Reno', 'Jean', '78 Boulevard de Léon', '51200', 'Montmirail'),
(28, 'Lanvin', 'Gérard', '84 avenue de l''aile ou la cuisse', '92100', 'Boulogne-Billancourt'),
(29, 'Tautou', 'Audrey', 'rue de Montmartre', '63110', 'Beaumont'),
(30, 'Cotillard', 'Marion', '45 rue de la Même', '13001', 'Marseille'),
(31, 'Duris', 'Romain', '76 rue de l''arnaqueur', '06000', 'Nice'),
(32, 'Depardieu', 'Gérard', '57 rue du conte de Monté-Cristo', '36000', 'Chateauroux'),
(33, 'Youn', 'Michaël', 'rue de la beuze', '92150', 'Suresnes'),
(34, 'Poelvoorde', 'Benoït', '22 rue du Boulet', '22500', 'Paimpol'),
(35, 'Paradis', 'Vanessa', '12 rue des arnaqueurs', '94100', 'Saint-Maur-des-Fosses'),
(36, 'Wilson', 'Lambert', '100 rue de Dieu', '92200', 'Neuilly-sur-Seine'),
(37, 'Garcia', 'José', '65 rue de la vérité', '75001', 'Paris'),
(38, 'Luchini', 'Fabrice', '73 rue de Beaumarchais', '75016', 'Paris'),
(39, 'Baye', 'Nathalie', '33 rue de Vénus', '27150', 'Mainneville'),
(40, 'Magimel', 'Benoït', '47 rue des petits mouchoirs', '33950', 'Lége-Cap-Ferret'),
(41, 'Cluzet', 'François', '7 rue des apprentis', '75018', 'Paris'),
(42, 'Frot', 'Catherine', 'rue Odette', '69110', 'Sainte Foy-les-Lyon'),
(43, 'Dupontel', 'Albert', '11 impasse de Bernie', '78100', 'Saintermain-en-Laye'),
(44, 'Huppert', 'Isabelle', '8 rue des femmes', '75002', 'Paris'),
(45, 'Deneuve', 'Catherine', '12 rue de Rochefort', '50100', 'Cherbourg-Octeville'),
(46, 'de France', 'Cécile', '17 rue de l''auberge espagnole', '08000', 'Charlesville-Mézières');

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
SELECT 
clients.nom AS nom,
clients.prenom AS prenom,
clients.adresse AS adresse,
clients.cpo AS code_postale,
clients.ville AS ville
FROM clients

