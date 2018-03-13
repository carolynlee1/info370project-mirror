library(rpart)

#devtools::install_github("dtkaplan/statisticalModeling")
library("statisticalModeling")

d3 <- read.csv("../bodyweight-data.csv")
bodyMassModel <- lm(Diff ~ Age + Creatine, data = d3)
d3
fmodel(bodyMassModel)

new <- data.frame(Age = c(20), Creatine = c(1)) # input go here
predict(bodyMassModel, new)

