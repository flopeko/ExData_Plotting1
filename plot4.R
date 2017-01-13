#creating plot 4 for exploratory data analysis course project 1
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

# creating date_time variable and setting locale to get the weekdays in english
my_data$date_time<- paste(as.Date(my_data$Date), my_data$Time)
my_data$date_time<- as.POSIXct(my_data$date_time)
Sys.setlocale("LC_TIME", "English_United States.1252")
weekdays(Sys.Date()+0:6)

# open png graphic device
png(file= "plot4.png", 
    width= 480, 
    height= 480)

# setting layout for multiple plots
par(mfrow = c(2,2))

# first plot
plot(my_data$date_time, my_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#second plot
plot(my_data$date_time, my_data$Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# third plot
plot(my_data$date_time, my_data$Sub_metering_1, 
     type="l", 
     ylab="Energy sub metering", 
     xlab="")
lines(my_data$date_time, my_data$Sub_metering_2, 
      col='red')
lines(my_data$date_time, my_data$Sub_metering_3, 
      col='blue')
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

#fourth plot
plot(my_data$date_time, my_data$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

# close graphic device
dev.off()