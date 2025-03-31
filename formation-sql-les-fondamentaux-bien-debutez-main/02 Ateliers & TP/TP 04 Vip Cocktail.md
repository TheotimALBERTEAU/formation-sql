# :cocktail: TP 4 VIP Cocktail - partie 2
<img src="../img/num/four.webp" width="100"> 
Prise en main des commandes :  
  
<code>INSERT INTO</code>    
<code>SELECT</code>    
   
| id | prenom | nom | age | inscription | etat | statut | cv | salaire |
|---|---|---|---|---|---|---|---|---|
| 1 | Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| 2 | George | CLONEY | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| 3 | Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |
    
![brad](../img/tp/tp2/brad.webp)
![george](../img/tp/tp2/george.webp)
![jean](../img/tp/tp2/jean.webp)
## Pour rappel voici la structure de la table

:one: - Ajouter les données        
:two: - Afficher le plus gros salaire (avec MAX)  [doc max w3](https://www.w3schools.com/sql/func_mysql_max.asp)    
:three: - Afficher le plus petit salaire (avec MIN)  [doc min w3](https://www.w3schools.com/sql/func_mysql_min.asp)      
:four: - Afficher le nom de l'acteur (et son salaire) qui a le plus petit salaire avec <code>LIMIT</code> & <code>ORDER BY</code>  
:five: - Afficher le nom de l'acteur (et son salaire) qui a le plus gros salaire avec <code>LIMIT</code> & <code>ORDER BY</code>   
:six: - Afficher le salaire moyen  
:seven: - Afficher le nombre de personnes  
:eight: - Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000 avec <code>BETWEEN</code>  
:nine: Proposer une requete avec  <code>UPPER()</code> & <code>LOWER()</code>  
**10** - Afficher les personnes dont le prenom contient 'bra'  
**11** - Trier par age les membres  
**12** - Afficher le nombre d'acteurs "membre"   
**13** - Afficher le nombre des membres et  des non membres  

# Résultats attendus

:two: - Afficher le plus gros salaire (avec MAX)  [doc max w3](https://www.w3schools.com/sql/func_mysql_max.asp)    
  
| plus_gros_salaire |
|---|
| 4000000 |
  
:three: - Afficher le plus petit chiffre d'affaire (avec MIN)  [doc min w3](https://www.w3schools.com/sql/func_mysql_min.asp) 
   
| plus_petit_salaire |
|---|
| 1000000 |
  
:four: - Afficher le nom de l'acteur (et son salaire) qui a le plus petit salaire avec <code>LIMIT</code> & <code>ORDER BY</code>
    
| prenom | nom | salaire |
|---|---|---|
| Jean | DUJARDIN | 1000000 |
  
:five: - Afficher le nom de l'acteur (et son salaire) qui a le plus gros salaire avec <code>LIMIT</code> & <code>ORDER BY</code>
  
| prenom | nom | salaire |
|---|---|---|
| George | CLONEY | 4000000 |
     
:six: - Afficher le salaire moyen
  
| salaire_moyen |
|---|
| 2333333.3333 |   
  
:seven: - Afficher le nombre de personnes  
  
| nb_personnes |
|---|
| 3 | 
  
:eight: - Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000 avec <code>BETWEEN</code>
  
| id | prenom | nom | salaire |
|---|---|---|---|
| 1 | Brad | PITT | 2 000 000 |
  
:nine: Proposer une requete avec  <code>UPPER()</code> & <code>LOWER()</code> 
  
| id | prenom | nom |
|---|---|---|
| 1 | Brad | pitt | 


| id | prenom | nom |
|---|---|---|
| 1 | BRAD | pitt | 


**10** - Afficher les personnes dont le prenom contient 'bra'  
  
| id | prenom | nom | salaire |
|---|---|---|---|
| 1 | Brad | PITT | 2 000 000 |
   
**11** - Trier par age les membres 
   
| prenom | nom | age |
|---|---|---|
| Jean | DUJARDIN | 51 |
| George | Cloney | 62 |
  
**12** - Afficher le nombre d'acteurs "membre" 
  
| nb_membres |
|---|
| 2 | 
  
**13** - Afficher le nombre des membres et  d'acteur "non membre"
   
| membre | nb_acteur| 
|---|---|
| membre | 2 |  
| non membre | 1 | 
  