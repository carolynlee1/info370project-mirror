d3 <- read.csv("../condensed.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)
View(d3)
model1 <- rpart(benchpress ~ Initial.Training + Creatine..y.n. + Sex, data = d3, cp=0.001)
fmodel(model1)
ggplot(data = d3, mapping=aes(x=benchpress, y=Sex, color=Creatine..y.n.)) + geom_point()

evaluate_model(model1)
library(plotrix)
num <- jiggle(19, range=c(40,50))
df <- data.frame(num)

GetJiggle <- function(old.df, n, min, max) {
  list <- jiggle(n, range=c(min,max))
  View(list)
  list <- data.frame(unname(list))
  
  master.df <- rbind(old.df, list)
  return(master.df)
}

test <- evaluate_model(model1)

foo <-test$model_output[1]
