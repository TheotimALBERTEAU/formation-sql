# :cocktail: TP 2 - VIP Cocktail
<img src="../img/num/two.webp" width="100"> 
  
Prise en main des commandes :  
  
<code>CREATE DATA BASE</code>    
<code>CREATE TABLE</code>    
<code>DROP DATA BASE</code>    
<code>DROP TABLE</code>    
<code>IF EXISTS</code>    
<code>IF NOT EXISTS</code>   
   
Nou allons créer une liste d'invités pour des soirées VIP  
![brad](../img/tp/tp2/brad.webp)
![george](../img/tp/tp2/george.webp)
![jean](../img/tp/tp2/jean.webp)
  

## Partie 1 - Création de la table
Chaque personne a :
  
- un prénom
- un nom  
- un age  
- la date de sont inscription
- un etat : Valide ou NON Valide (un booléen)
- un statut : membre ou non membre (une énumération)
- un CV
- salaire annuel
  


### Les données
Voici les données qui seront ajoutées  
Afin de vous aider  à choisir les types de champs  
| id | prenom | nom | age | inscription | etat | statut | cv | salaire |
|---|---|---|---|---|---|---|---|---|
| 1 | Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| 2 | George | CLONEY | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| 3 | Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |

:one: Créer une base de donnée : **invitation**  
:two: Créer une table : **personne**  
:three: Rajouter le prefixe <code>inv_</code> à votre table   

## Le modèle relationnel
<img src="../img/db-svg/03-personne.png" width="200">