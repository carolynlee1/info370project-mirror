d1 <- read.csv("./Documents/INFO370/Project/tabula-dataset1.csv")
d2 <- read.csv("./Documents/INFO370/Project/tabula-dataset2.csv")

# Clean Column Names
names(d2)[3] <- "Pre-Test"
names(d2)[4] <- "Mid-Test"
names(d2)[5] <- "Post-Test"

# Remove unnecessary row
d2 <- d2[-c(1, 22), ]

# Clean data points
d2[3] <- apply(d2[3], 1, function(x) gsub("[(]((\\d+)|(\\D+))+", "", x))
d2[3] <- apply(d2[3], 1, function(x) gsub(",|~", ".", x))
d2[4] <- apply(d2[4], 1, function(x) gsub("[(]((\\d+)|(\\D+))+", "", x))
d2[4] <- apply(d2[4], 1, function(x) gsub(",|~", ".", x))
d2[5] <- apply(d2[5], 1, function(x) gsub("[(]((\\d+)|(\\D+))+", "", x))
d2[5] <- apply(d2[5], 1, function(x) gsub(",|~", ".", x))
d2[5] <- apply(d2[5], 1, function(x) gsub("I", "1", x))

# Change to numeric values
d2[3] <- apply(d2[3], 1, function(x) as.numeric(x))
d2[4] <- apply(d2[4], 1, function(x) as.numeric(x))
d2[5] <- apply(d2[5], 1, function(x) as.numeric(x))

# Make column for post - pre
d2$Difference <- d2$`Post-Test` - d2$`Pre-Test`

View(d2)

barplot(main="Body Mass (kg), Placebo", as.matrix(d2[2, c(3, 4, 5)]),
        xpd=FALSE, ylim=c(83.5, 85.5))

