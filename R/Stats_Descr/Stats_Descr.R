# REPERTOIRE DE TRAVAIL ------------------------------#
# Définir ici votre répertoire de travail
#  c-à-d le dossier où se trouve les données
setwd("~/Documents/R/Stats_Descr/")

# Vous pouvez définir le répertoire avec le menu
#  "Session">"Set Working Directory"


# CHARGEMENT DES DONNÉES ----------------------------#
# Lecture du fichier 'data.csv' dans l'objet 'dt'
dt = read.table('data.csv', h=T, sep=";")

# Utilisation de h pour 'header' et de T pour 'True
 

# STATISTIQUES DESCRIPTIVES -------------------------#
# Fonction de base de R, 'summary()'
summary(dt)
# Summary donne le minimum, maximum, la moyenne, médiane et le 1er et 3e quartiles
# Pour les variables non numériques, donne le nombre d'occurences par valeur 

# Fonction 'describe()' du module 'Hmisc'
library(Hmisc) # Chargement du module Hmisc
describe(dt)   # Exécution de la fonction describe sur les données dt

# Fonction 'stat.desc' du module 'pastecs'
library(pastecs) # Chargement du module psych
stat.desc(dt) # Exécution de la fonction describe sur les données dt

# Fonction 'describe()' du module 'psych'
library(psych) # Chargement du module psych
describe(dt) # Exécution de la fonction describe sur les données dt
# Donne le nom et position des variables, le nombre d'observations, la moyenne, écart-type, la moyenne trimmée, la médiane, valeur minimum, maximum, l'étendue, la symmétrie, l'applatissement et l'erreur standard

# Appel de la fonction describe sur un sous ensemble de données :
describe( dt[dt$Genre=='M', ] )
describe( dt[dt$Genre=="F", ] )

# Création des sous-ensembles avant d'appeler la fonction describe()
homme = dt[dt$Genre=='M', ]
femme = dt[dt$Genre=='F', ]
describe(homme)
describe(femme)

# Fonction 'describeBy()' du module 'psych'
describeBy(dt, group=dt$Genre)   # Mêmes informations mais par genre
describeBy(dt, group=dt$Anxiete) # Idem par niveau d'anxiété


describeBy(dt, list(dt$Genre,dt$Anxiete)) # Par genre et niveau d'anxiete
# Note : pas obliger d'écrire group=
# Note 2 : plusieurs facteurs s'indiquent grâce à une liste soit 'list()'


# EXPLORATION VISUELLE ------------------------------#
# Création d'un histogramme sur la quatirème colonne
hist( dt[,4] )

# Création d'un histogramme par nom de la colonne
hist( dt$TempsRep )

# Représentation graphique pour des données qualitatives
# Création d'une table de contingence pour le genre
table_genre = table( dt$Genre )

# Représentation graphique de cette table avec barplot()
barplot( table_genre )

# Boite à moustaches pour connaître la distribution des données
boxplot( dt$TempsRep )

# Même graphique mais avec l'ajout d'un titre et en modifiant l'échelle de l'ordonnée
boxplot( dt$TempsRep, ylim=c(50,900), main='Boite à moustaches\n pour les temps de réponse' )

# Note : les commandes graphiques seront détaillées dans un prochain article. 

# Illustration de données extrêmes
dto = read.table('data_outliers.csv', h=T, sep=';')
boxplot(dto$TempsRep, ylim=c(50,900), main='Boite à moustaches pour\nles temps de réponse avec outilers')
