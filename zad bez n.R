# Zadanie
# Proszę podać takie dwa wektory x i y, które będą różne, ale gdybyśmy nie porównali length(x) z length(y), to poniższy kod pokaże równość:

x <- c(1, 3, 5)    # zamiast 0 wpisać jakiś inny wektor swojego pomysłu
y <- c(1,x[-1])   # zamiast 0 wpisać jakiś inny wektor swojego pomysłu
if (sum(x == y) == length(x)) { #  nie wykonujemy tego testu: length(x) == length(y)
  print("równość")
} else {
  print("nie są równe")
}
