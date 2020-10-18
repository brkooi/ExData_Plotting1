# Data science Course 4 - Getting and Cleaning data
# Week 1
# Script Plot1.R


#load packages
packages <- c("data.table","dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# download file and unzip datafiles
path_files<-getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "household_power_consumption.zip")
unzip(zipfile = "household_power_consumption.zip")

hhpc<-fread("household_power_consumption.txt")
cn<-names(hhpc)
hhpc<-hhpc  %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
hhpc$Date<-as.Date(hhpc$Date, "%d/%m/%Y")
hhpc$Time<-strptime(hhpc$Time, "%H:%M:%S")


