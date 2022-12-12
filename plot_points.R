library(vioplot)
data(iris)
species_list <- lapply(levels(iris[["Species"]]), 
                       function(x) {
                         iris[ iris[, "Species"] == x, 1:4]
                       })
names(species_list) <- levels(iris[["Species"]])
minx <- min(iris$Petal.Length)
maxx <- max(iris$Petal.Length)
miny <- min(iris$Petal.Width)
maxy <- max(iris$Petal.Width)

#trzy chmury punktów
plot(iris[iris$Species=="setosa", 3:4], col=palette.colors(palette = "Okabe-Ito")[2], pch=16, cex=0.8, xlim=c(minx, maxx ), ylim=c(miny, maxy), main="Separowalność setosa", xlab="Zmienna Petal.Length", ylab="Zmienna Petal.Width", cex.axis=0.9) #pch=16 - kółko
points(iris[iris$Species=="versicolor", 3:4], col=palette.colors(palette = "Okabe-Ito")[3], pch=17, cex=0.8 ) #pch=17 - trójkąt
points(iris[iris$Species=="virginica", 3:4], col=palette.colors(palette = "Okabe-Ito")[4], pch=18, cex=0.8 ) #pch=18 - romb

#pionowa linia i podpis
xpos <- ( min(iris[iris$Species=="versicolor", 3]) + max(iris[iris$Species=="setosa", 3]) )/2.0
lines(c(xpos, xpos), c(miny, maxy), col="red", lty=2, lwd=0.2)
text(xpos,2.5, paste("x=", xpos, sep=""), col="black", pos=2, cex=0.8, srt=90)  #pos=2 - na lewo, srt=90 - pisz w pionie

#pozioma linia i podpis
ypos <- ( min(iris[iris$Species=="versicolor", 4]) + max(iris[iris$Species=="setosa", 4]) )/2.0
lines(c(minx, maxx), c(ypos, ypos), col="red", lty=2, lwd=0.2)
text(6.8, ypos, paste("y=", ypos, sep=""), col="black", pos=3, cex=0.8)  #pos=3 - ponad punktem