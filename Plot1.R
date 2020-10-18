# Data science Course 4 - Exploratory Data Analysis
# Week 1 -Assignment
# Script plot1.R


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
hhpc$Date<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Global_active_power<-as.numeric(hhpc$Global_active_power)
hhpc$Global_reactive_power<-as.numeric(hhpc$Global_reactive_power)
hhpc$Voltage<-as.numeric(hhpc$Voltage)
hhpc$Global_intensity<-as.numeric(hhpc$Global_intensity)
hhpc$Sub_metering_1<-as.numeric(hhpc$Sub_metering_1)
hhpc$Sub_metering_2<-as.numeric(hhpc$Sub_metering_2)
hhpc$Sub_metering_3 <-as.numeric(hhpc$Sub_metering_3)

# open a PNG-device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# plot the histogram
with(hhpc, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

# close the device
dev.off()


