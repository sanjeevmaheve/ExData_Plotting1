## Our overall goal here is simply to examine how household energy usage varies
## over a 2-day period in February, 2007. Your task is to reconstruct the 
## following plots below, all of which were constructed using the base 
## plotting system.
##
## ASSUMPTION - 'household_power_consumption.txt' is available in 
## current-working-directory.
## Author - Sanjeev Kumar Maheve
##
library(dplyr)
library(datasets)
library(lubridate)
## The dataset has 2,075,259 rows and 9 columns. First calculate a rough 
## estimate of how much memory the dataset will require in memory before 
## reading into R. Make sure your computer has enough memory 
## (most modern computers should be fine).
variable.class<-c(rep('character',2),rep('numeric',7))
rawPowerConsumptionData <- read.table(file="household_power_consumption.txt", 
                                      sep=";", 
                                      na.strings='?', 
                                      blank.lines.skip=FALSE, 
                                      header=TRUE,
                                      colClasses=variable.class)

## Convert the custom date format to Date object.
rawPowerConsumptionData$Date <- as.Date(rawPowerConsumptionData$Date, "%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
## Note that in this dataset missing values are coded as ?.
reqdPowerConsumptionData <- subset(rawPowerConsumptionData, Date >= "2007-02-01" & 
                                       Date <= "2007-02-02")
## Remove the row.names inserted using subset function.
rownames(reqdPowerConsumptionData) <- NULL
