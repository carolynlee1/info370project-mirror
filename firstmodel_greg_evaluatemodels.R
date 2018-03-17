
d3 <- read.csv("initial training and sex data.csv")
library(ggplot2)
library(rpart)
library(statisticalModeling)
library(broom)
library(tidyverse)
View(d3)
#benchpress model
model1 <- rpart(benchpress ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
#squat model
model2 <- rpart(Squat ~ Initial.Training + Creatine + Sex, data = d3, cp=0.001)
#visualizing models
fmodel(model1) 
fmodel(model1) + geom_boxplot(data = d3, aes(group=interaction(Initial.Training, Creatine) ))
fmodel(model2)
#check model plot
ggplot(data = d3, mapping=aes(x=benchpress, y=Initial.Training, color=Creatine)) + geom_point()

interaction(d3$Initial.Training, d3$Creatine)
evaluate_model(model1)

test <- evaluate_model(model1)

foo <-test$model_output[1]

m1residuals <- tibble(r = d3$benchpress - predict(model1))

ggplot(data=m1residuals, aes(x=r)) + geom_histogram()

# plot is correct no 0 initial years training and tried creatine
d3 %>% filter(Sex=="Male" & Initial.Training==0 )

# not working b/c na's not removed from dataset (cleaning issue)
m2residuals <- d3$Squat - predict(model2)
hist(m2r$.resid)

