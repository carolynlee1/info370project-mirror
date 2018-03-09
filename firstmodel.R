d3 <- read.csv("~/370/group-formation-for-projects-team-awesome-possum/condensed.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)
View(d3)
model1 <- rpart(BP.1RM ~ Initial.Training.Status..years. + With.or.Without, data = d3)
model1
fmodel(model1)

evaluate_model(model1)
