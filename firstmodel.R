
d3 <- read.csv("../initial training and sex data.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)
View(d3)
#benchpress model
model1 <- rpart(benchpress ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
#squat model
model2 <- rpart(Squat ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
#visualizing models
fmodel(model1)
fmodel(model2)
#check model plot
ggplot(data = d3, mapping=aes(x=benchpress, y=Initial.Training, color=Creatine)) + geom_point()

evaluate_model(model1)

test <- evaluate_model(model1)

foo <-test$model_output[1]
