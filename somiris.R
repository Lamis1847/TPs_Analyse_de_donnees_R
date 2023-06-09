# package kohonen pour les fonctionalites des som
library(kohonen)
iris
#les SOM manipule que des donn�es num�rique,on enl�ve la 19�me colone qui repr�sente les classes
data_train <- iris[,-5]
# mettre les donn�es sous forme de matrice
# aussi centrer et normaliser les donn�es pour leur donner les m�me importance
data <- as.matrix(scale(data_train))
# Cr�er la grille som : on d�finie sa taille et la topologie
som_grid <- somgrid(xdim = 8, ydim=8, topo="hexagonal")
# algorithm SOM
som <- som(data,grid=som_grid,rlen=100,alpha=c(0.05,0.01),keep.data = TRUE)
summary(som)
# Pour savoir si le nombre d'it�rations est suffisant
plot(som, type="changes")
# afficher nombre d'�l�ments par noeud
plot(som, type="count")
plot(som, type="mapping",pch=20)
# afficher la distance dans le voisinage des noeuds
plot(som, type="dist.neighbours")
#affiche la distribution des attributs par noeud
plot(som, type="codes",codeRendering="segments")
################### Afficher les heatmaps par �l�ment ##########################
data <- som$codes
# clustring hi�rarchique
data=unlist(data)
d=dist(data,method="euclidean")
cah=hclust(d, method="ward.D")
groupes=cutree(cah,k=3)
groupes
# afficher resultat clustring:
plot(som, type="mapping",bgcol=c("yellowgreen","steelblue","red","pink")[groupes])
add.cluster.boundaries(som,clustering=groupes)
