# TP 3 Le monde des chats - partie 2
<img src="../img/num/three.webp" width="100"> 
Prise en main des commandes :  
  
<code>INSERT INTO</code>    
<code>SELECT</code>    
   
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |
| 2 | Siamois | bleu | 15 |
| 3 | Bengal | marron | 18 |
| 4 | Scottish Fold | marron | 10 |
  
![maincoon](../img/tp/tp1/maincoon.webp)
![siamois](../img/tp/tp1/siamois.webp)
![bengal](../img/tp/tp1/bengal.webp)
![scottish](../img/tp/tp1/scottish.webp)

## Pour rappel voici la structure de la table

:one: - Ajouter les données  
:two: - Afficher le chat avec l'id :2  
:three: - Trier les chats par nom et par age  
:four: - Afficher les chats qui vive entre 11 et 19 ans  
:five: - Afficher le ou les chats dont le nom contient 'sia'  
:six: - Afficher le ou les chats dont le nom contient 'a'  
:seven: - Afficher la moyenne d'age des chats avec <code>AVG</code> [doc w3school](https://www.w3schools.com/sql/func_mysql_avg.asp)  
:eight: - Afficher le nombre de chats dans la table   
:nine: - Afficher le nombre de chat avec couleur des yeux marron  
**10** - Afficher le chat avec la plus petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>     
**11** - Afficher le chat avec la plus longue durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>     
**12** - Afficher le nombre de chat par couleur des yeux    $\color{red}{\text{[BONUS]}}$    :cactus::cactus:  avec <code>COUNT()</code> et <code>GROUP BY</code> [doc w3 school](https://www.w3schools.com/mysql/mysql_groupby.asp)  
**13** - Ajouter les données à partir d'un fichier excel   $\color{red}{\text{[BONUS]}}$ :cactus::cactus::cactus:   
- Transformer en le fichier <code>.xls</code> en <code>.csv</code>  

|nom|yeux|age|
|---|---|---|
|Sphynx|bleu|15|
|Munchkin cat|vert|12|
|American Curl|marron|10|

# Résultats attendus
:two: - Afficher le chat avec l'id :2 
| id | nom | yeux | age |
|---|---|---|---|
| 2 | Siamois | bleu | 15 |
  
:three: - Trier les chats par nom et par age  

| id | nom | yeux | age |
|---|---|---|---|
| 3 | Bengal | marron | 18 |
| 1 | Maine coon | marron | 20 |
| 4 | Scottish Fold | marron | 10 |
| 2 | Siamois | bleu | 15 |

:four: - Afficher les chats qui vive entre 11 et 19 ans  
| id | nom | yeux | age |
|---|---|---|---|
| 3 | Bengal | marron | 18 |
| 2 | Siamois | bleu | 15 |

:five: - Afficher le ou les chats dont le nom contient 'sia'
| id | nom | yeux | age |
|---|---|---|---|
| 2 | Siamois | bleu | 15 |  

:six: - Afficher le ou les chats dont le nom contient 'a'
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |
| 2 | Siamois | bleu | 15 |
| 3 | Bengal | marron | 18 |

:seven: - Afficher la moyenne d'age des chats 
| age_moyen |
|---|
| 15.7500 |

:eight: - Afficher le nombre de chats dans la table
| nb_chat |
|---|
| 4 |   

:nine: - Afficher le nombre de chat avec la couleur des yeux marron
| couleur | nb_chat |
|---|---|
| marron | 3 |

**10** - Afficher le chat avec la plus petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>    
| id | nom | yeux | age |
|---|---|---|---|
| 4 | Scottish Fold | marron | 10 |
    
**11** - Afficher le chat avec la plus longue durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>      
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |


**12** - Afficher le nombre de chats par couleur des yeux
| couleur | nb_chat |
|---|---|
| marron | 3 |
| bleu | 1 |



**13** Ajouter les données à partir d'un fichier excel
- Transformer en le fichier <code>.xls</code> en <code>.csv</code>  

|nom|yeux|age|
|---|---|---|
|Sphynx|bleu|15|
|Munchkin cat|vert|12|
|American Curl|marron|10|

