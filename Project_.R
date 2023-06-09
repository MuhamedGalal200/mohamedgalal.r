install.packages("zoo")
library(zoo)
install.packages("ggplot2")
library(ggplot2)

#Reprocessing

#set the work directory
setwd("E:\\Grade 4")

#read the data file
dataset <- read.csv('G4_howell.csv')

#the data dimension 
dim(dataset)

#get structure of the data
str(dataset)

#Display some statics about the data
summary(dataset)

#number of rows and columns 
print(nrow(dataset))
print(ncol(dataset))

#data columns name
print(colnames(dataset))

#Get all rows contain missing data
dataset[ ! complete.cases(dataset), ]

#count missing values
sum(is.na(dataset))

#number of missing value in each column
colSums(is.na(dataset))

#fill missing data
dataset$weight <- na.locf(dataset$weight)

#drop column with missing values 
dataset$Overweight <- NULL
dataset

#get clear age
dataset$age <- round(dataset$age)

#remove text from numeric data
dataset$weight<-gsub(" kg", " ",dataset$weight)

#convert data type from chr to num 
dataset$weight <- as.numeric(dataset$weight)

#Visualization

#Bar Chart
ggplot(data = dataset, aes(x = age)) + 
  geom_bar(fill = "black", color = "white", alpha = 0.5) +
  ggtitle("Population Age") +
  labs(y = "Number of populations", x = ("Age of populations"))

#Histogram
ggplot(data = dataset, aes(x = age, fill = sex)) + 
  geom_histogram(binwidth = 5., alpha = 0.5) +
  ggtitle("Population Age") +
  labs(y = "Number of populations", x = ("Age of populations"))

#Scatter plot
ggplot(dataset, aes(age, weight)) + 
  geom_point(aes(color=weight)) + 
  labs(x="Age of population", y="Weight")
draw_sc + geom_point(aes(color=weight)) + stat_smooth(se=FALSE)