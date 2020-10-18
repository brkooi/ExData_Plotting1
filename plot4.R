# Data science Course 4 - Exploratory Data Analysis
# Week 1 -Assignment
# Script plot4.R


#load packages
packages <- c("data.table","dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# download file and unzip datafiles
path_files<-getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip")
unzip(zipfile = "household_power_consumption.zip")

# read unzipped file into table
hhpc<-fread("household_power_consumption.txt")

# filter the data on the dates to analyze
hhpc<-hhpc  %>% filter(Date=="1/2/2007" | Date=="2/2/2007")

# transform the variables to the neccesary data-types
hhpc$Global_active_power<-as.numeric(hhpc$Global_active_power)
hhpc$Global_reactive_power<-as.numeric(hhpc$Global_reactive_power)
hhpc$Voltage<-as.numeric(hhpc$Voltage)
hhpc$Global_intensity<-as.numeric(hhpc$Global_intensity)
hhpc$Sub_metering_1<-as.numeric(hhpc$Sub_metering_1)
hhpc$Sub_metering_2<-as.numeric(hhpc$Sub_metering_2)
hhpc$Sub_metering_3 <-as.numeric(hhpc$Sub_metering_3)

# concatenate Date and Time to DateTime
hhpc$DateTime <- as.POSIXct(paste(hhpc$Date, hhpc$Time), format="%d/%m/%Y %H:%M:%S")

# open a PNG-device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# fill the plot-file to 4 plots columnwise
par(mfcol = c(2, 2))

# plot first line-diagram
plot(hhpc$DateTime, hhpc$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

# plot second line-diagram
plot(hhpc$DateTime, hhpc$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(hhpc$DateTime, hhpc$Sub_metering_2,type="l",col="red")
lines(hhpc$DateTime, hhpc$Sub_metering_3,type="l",col="blue")

# add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1, bty = "n")

# plot third line-diagram
plot(hhpc$DateTime, hhpc$Voltage,type="l", xlab="datetime", ylab="Voltage")


# plot fourth line-diagram
plot(hhpc$DateTime, hhpc$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")


# close the device
dev.off()
