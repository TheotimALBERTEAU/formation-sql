# Voici le lien du [cours](https://github.com/seven-valley/formation-sql-les-fondamentaux-bien-debutez)

# Bases du SQL

## 1. Principales commandes SQL
### Sélectionner des données 
```sql
SELECT colonne1, colonne2 FROM table;
```
> Affiche certaines colonnes d'une table.
> - ```SELECT * FROM table;``` → sélectionne toutes les colonnes.

### Filtrer des résultats (```WHERE```)
```sql
SELECT * FROM clients WHERE age > 30;
```
> Affiche les clients ayant plus de 30 ans.

### Ordonner les résultats (```ORDER BY```)
```sql
SELECT * FROM produits ORDER BY prix DESC;
```
> Trie les produits par prix décroissants.
> (```ASC``` = croissant, ```DESC``` = décroissant)

### Limiter les résultats (```LIMIT```)
```sql
SELECT * FROM clients LIMIT 5;
```
> Affiche seulement les 5 premiers clients.

## 2. Manipulation des données
### Insérer des données (```INSERT INTO```)
```sql
INSERT INTO clients (nom, age) VALUES ('Manon', 42);
```
> Ajoute un client nommé Manon, âgé de 42 ans.

### Modifier les données (```UPDATE```)
```sql
UPDATE clients SET age = 26 WHERE nom = 'Manon';
```
> Change l'âge de Manon à 26 ans.

### Supprimer des données (```DELETE```)
```sql
DELETE FROM clients WHERE nom = 'Manon';
```
> Supprime Manon de la table clients.

## 3. Gérer les tables
### Créer une table (```CREATE TABLE```)
```sql
CREATE TABLE clients (
    id INT AUTO_INCREMENT,
    nom VARCHAR(50),
    age INT 
);
```
> Crée une table ```clients``` avec une clé primaire ```id```.

### Supprimer une table (```DROP TABLE```)
```sql
DROP TABLE clients;
```
> Supprime complètement la table ```clients```.

## 4. Relations entre tables
### Jointure entre tables (```JOIN```)
```sql
SELECT commandes.id, clients.nom
FROM commandes
JOIN clients ON commandes.client_id = clients.id;
```
> Associe la table ```commandes``` à la table ```clients``` via ```client_id```.

## 5. Fonctions utiles
|Fonction|Utilisation|
|```COUNT(*)```|Nombre d'éléments|
|```AVG(colonne)```|Moyenne|
|```SUM(colonne)```|Somme|
|```MIN(colonne)```|Valeur minimale|
|```MAX(colonne)```|Valeur maximale|

### Exemple : 
```sql
SELECT COUNT(*) FROM clients WHERE age > 30;
```
> Compte le nombre de clients de plus de 30 ans.