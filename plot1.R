#creating plot 1 for exploratory data analysis course project 1
#set working directory
setwd("C:/_almacen/coursera/exploratory data analysis")

# read the data
raw_data<- read.table("household_power_consumption.txt", 
                      header= TRUE, 
                      sep= ";", 
                      stringsAsFactors= FALSE, 
                      na.strings = "?")

# convert Date variable to date
raw_data$Date<- as.Date(raw_data$Date, format= "%d/%m/%Y")

# subsetting the data
my_data<- subset(raw_data, raw_data$Date>= as.Date("2007-02-01") & raw_data$Date<= as.Date("2007-02-02"))

# open png graphic device
png(file = "plot1.png", 
    width = 480, 
    height = 480)

# generating the plot
hist(my_data$Global_active_power, 
     col= "red", 
     main= "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# close graphic device
dev.off()