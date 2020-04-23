# Question 1

filename = file.choose()                            #To choose a file manually    
data = read.table(filename,TRUE,",",na.string="*")  
CarP = data.frame(data)                             #Create dataframe
CarP

# Question 2

filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
i=1
while(i<=length(CarP$drv))
{
  if(CarP$drv[i]=="f")     # to check for front wheel drive
  {
    print(CarP[i,])        # prints the entire row details of that front wheel drive
    i=i+1
  }
  else
  {
    i=i+1
  }
}

# Question 3 - It has no missing values

filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
any(is.na(CarP))     # to check if any column has missing value

# Question 4

filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
CarP$Ratio = with(CarP,hwy/cty)  # to find ration between hwy and cty and creates a column Ratio
print(CarP$Ratio)

# Question 5

filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
#creates scatter plot
plot(CarP$cyl,CarP$hwy,xlab="Number of cylinders",ylab="Miles per gallon on Highway", 
     main="Question 5_Janani\nScatterplot between Number of Cylinders and Miles per Gallon on Highway",
     pch=3,col="red")                                                   

# Question 6
library(ggplot2)
filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
graph <-ggplot(CarP,aes(x=hwy,y=cty))  #plot between hwy and cty
print(graph+geom_point(aes(color=cyl))+ggtitle("Question 6_Janani"))   #Plots agains cyl

# Question 7
library(ggplot2)
filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
graph <-ggplot(data=CarP,aes(x=drv)) + 
  geom_histogram(aes(y = ..count..),stat="count")   #plots an histogram
print(graph+geom_bar(aes(fill=factor(drv)))+ggtitle("Question 7_Janani"))   #plots against drive type

# Question 8

library(dplyr)
filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
CarPFunction <- function(CarP){
  result = filter(CarP,cty>20)  #filters data based on cty value greater than 20
  result = data.frame(result$manufacturer,result$model,result$year)
  return(result)
  write.table(result,"/Users/saich/Desktop/CarPSubset.txt",sep="\t",append=FALSE,row.names=FALSE,col.names = TRUE)  #write values to the text file
  
}
result = CarPFunction(CarP)

# Question 9

filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")  
aggregate(data[,8:9],list(data$manufacturer),mean) #finds average between cty and hwy for each model

# Question 10
library(dplyr)
filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
output = CarP %>% group_by(manufacturer) %>% count(manufacturer,cyl) %>% filter(n==max(n)) #group by manufacturer and counts cyl for each 
                                                                                           #then filters the maximum out of it
output[1:2]













filename = file.choose()
data = read.table(filename,TRUE,",",na.string="*")
CarP = data.frame(data)
i=1
while(i<length(CarP$cty))
{
  if(CarP$cty[i]>20)
  {
    print(CarP$cty[i])
    #mydata <- read.csv(filename,header = TRUE,sep = ",")
    #print(data$cty)
    i=i+1
  }
  else
  {
    i=i+1
  }
}











