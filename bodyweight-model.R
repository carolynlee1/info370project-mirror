library(rpart)

devtools::install_github("dtkaplan/statisticalModeling")
library("statisticalModeling")

d3 <- read.csv("../bodyweight-data.csv")
bodyMassModel <- lm(Diff ~ Age + Creatine, data = d3)
d3
fmodel(bodyMassModel)