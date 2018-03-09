library(rpart)

devtools::install_github("dtkaplan/statisticalModeling")
library("statisticalModeling")

d3 <- read.csv("~/Downloads/awesomepossum copy/CreatineDataStudy.csv")
bodyMassModel <- lm(Diff ~ Age + Creatine, data = d3)

fmodel(bodyMassModel)