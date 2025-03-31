-- Suppression et création de la base de données
DROP DATABASE IF EXISTS gestion_facturation;
CREATE DATABASE gestion_facturation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestion_facturation;

-- Création de la table Clients
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

-- Création de la table Projets
CREATE TABLE projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    nom VARCHAR(255) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- Création de la table Devis
CREATE TABLE devis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projet_id INT NOT NULL,
    reference VARCHAR(50) NOT NULL UNIQUE,
    montant DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (projet_id) REFERENCES projets(id)
);

-- Création de la table Factures
CREATE TABLE factures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    devis_id INT NOT NULL,
    reference VARCHAR(50) NOT NULL UNIQUE,
    info VARCHAR(255) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    client_id INT NOT NULL,
    date_facture DATE NOT NULL,
    date_paiement DATE NULL,
    FOREIGN KEY (devis_id) REFERENCES devis(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- Insertion des données Clients
INSERT INTO clients (nom) VALUES
('Mairie de Rennes'),
('Neo Soft'),
('Sopra'),
('Accenture'),
('Amazon');

-- Insertion des données Projets
INSERT INTO projets (client_id, nom) VALUES
(1, 'Creation de site internet'),
(2, 'Logiciel CRM'),
(3, 'Logiciel de devis'),
(4, 'Site internet ecommerce'),
(2, 'Logiciel ERP'),
(5, 'Logiciel Gestion de Stock');

-- Insertion des données Devis
INSERT INTO devis (projet_id, reference, montant) VALUES
(1, 'DEV2100A', 3000),
(1, 'DEV2100B', 5000),
(2, 'DEV2100C', 5000),
(3, 'DEV2100D', 3000),
(4, 'DEV2100E', 5000),
(5, 'DEV2100F', 2000),
(6, 'DEV2100G', 1000);

-- Insertion des données Factures
INSERT INTO factures (devis_id, reference, info, total, client_id, date_facture, date_paiement) VALUES
(1, 'FA001', 'Site internet partie 1', 1500, 1, '2023-09-01', '2023-10-01'),
(1, 'FA002', 'Site internet partie 2', 1500, 1, '2023-09-20', NULL),
(3, 'FA003', 'Logiciel CRM', 5000, 2, '2024-02-01', NULL),
(4, 'FA004', 'Logiciel devis', 3000, 3, '2024-03-03', '2024-04-03'),
(5, 'FA005', 'Site internet ecommerce', 5000, 4, '2023-03-01', NULL),
(6, 'FA006', 'Logiciel ERP', 2000, 2, '2023-03-01', NULL);

-- Afficher toutes les factures avec le nom des clients
SELECT factures.reference AS Facture, clients.nom AS Client, factures.info, factures.total, factures.date_facture AS date, factures.date_paiement AS paiement
FROM factures
JOIN clients ON factures.client_id = clients.id;

-- Afficher le nombre de factures par client
SELECT clients.nom AS Client, COUNT(factures.id) AS nb_factures
FROM clients
LEFT JOIN factures ON clients.id = factures.client_id
GROUP BY clients.nom;

-- Afficher le chiffre d'affaire par client
SELECT clients.nom AS Client, SUM(factures.total) AS ca_par_client
FROM clients
LEFT JOIN factures ON clients.id = factures.client_id
GROUP BY clients.nom;

-- Afficher le CA total
SELECT SUM(total) AS ca_total FROM factures;

-- Afficher la somme des factures en attente de paiement
SELECT SUM(total) AS total_factures
FROM factures
WHERE date_paiement IS NULL;

-- Afficher les factures en retard de paiement (> 30 jours)
SELECT reference AS facture, DATEDIFF(NOW(), date_facture) AS nb_jour
FROM factures
WHERE date_paiement IS NULL AND DATEDIFF(NOW(), date_facture) > 30;

-- Afficher les factures en retard de paiement avec le nom du client
SELECT clients.nom AS Client, factures.reference AS Facture, DATEDIFF(NOW(), factures.date_facture) AS nb_jour
FROM factures
JOIN clients ON factures.client_id = clients.id
WHERE factures.date_paiement IS NULL AND DATEDIFF(NOW(), factures.date_facture) > 30;

-- Ajouter une pénalité de 2 euros par jour de retard
SELECT clients.nom AS Client, factures.reference AS Facture, DATEDIFF(NOW(), factures.date_facture) AS nb_jour,
       DATEDIFF(NOW(), factures.date_facture) * 2 AS penalite
FROM factures
JOIN clients ON factures.client_id = clients.id
WHERE factures.date_paiement IS NULL AND DATEDIFF(NOW(), factures.date_facture) > 30;

-- Afficher la moyenne du CA par client
SELECT AVG(ca_par_client) AS moyenne_ca_client FROM (
    SELECT clients.nom AS Client, SUM(factures.total) AS ca_par_client
    FROM clients
    LEFT JOIN factures ON clients.id = factures.client_id
    GROUP BY clients.nom
) AS sous_requete;
