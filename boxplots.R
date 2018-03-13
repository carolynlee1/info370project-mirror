d3 <- read.csv("../initial training and sex data.csv")

squat.vs.years.plot <- boxplot(Squat ~ Initial.Training, data = d3, main="Effect of Initial Training on Increase in Benchpress 1RM", xlab="Initial Training Years", ylab="% Increase in Squats")
bp.vs.years.plot <- boxplot(benchpress ~ Initial.Training, data = d3, main="Effect of Initial Training on Increase in Squat 1RM", xlab="Initial Training Years", ylab="% Increase in Benchpress")
squat.vs.sex.plot <- boxplot(Squat ~ Sex, data = d3, main="Effect of Gender on Increase in Squat 1RM", xlab="Sex", ylab="% Increase in Squats")
bp.vs.sex.plot <- boxplot(benchpress ~ Sex, data = d3, main="Effect of Gender on Increase in Benchpress 1RM", xlab="Sex", ylab="% Increase in Benchpress")

