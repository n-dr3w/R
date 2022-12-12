####  konfiguracja: ładowanie bioblioteki vioplot, a także zbiór danych iris i zmienna species_list
library(vioplot)
data(iris)
species_list <- lapply(levels(iris[["Species"]]), 
                       function(x) {
                         iris[ iris[, "Species"] == x, 1:4]
                       })
names(species_list) <- levels(iris[["Species"]])



####  właściwy kod do wykresów wiolinowych
lapply(lapply(1:4, 
              function(i) list(indeks=i, dane=lapply(species_list, 
                                                     function(x) x[[i]]))),
       function(x) {
         vioplot(x$dane, main=colnames(iris)[x$indeks], col=palette.colors(palette = "Okabe-Ito")[2:4])
         if (x$indeks %in% c(3,4)) {
           ypos=(min(x$dane$versicolor) + max(x$dane$setosa))/2.0
           lines(c(0, 4), c(ypos, ypos), col="red", lty=2, lwd=0.2)
           text(3.5, ypos, paste("y=", ypos, sep=""), col="black", pos=3, cex=0.8)
         }
       })