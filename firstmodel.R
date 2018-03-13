
d3 <- read.csv("~/370/group-formation-for-projects-team-awesome-possum/initial training and sex data.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)
library(dplyr)
View(d3)

bp.model <- rpart(benchpress ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
squat.model <- rpart(Squat ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
fmodel(bp.model)
fmodel(squat.model)
ggplot(data = d3, mapping=aes(x=benchpress, y=Initial.Training, color=Creatine)) + geom_point()

evaluate_model(model1)

test <- evaluate_model(model1)

foo <-test$model_output[1]
