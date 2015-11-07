#remove all variables
rm(list=ls()) 

#=============================Get Data====================================
#Data is assumed to be in current working directory.
#Read data in, data is separated by ";" without quotes, missing data is represented as "?" without quotes,
#use header information and do not convert strings to factors. obtain only data from 1/2/2007 and 2/2/2007.
#Convert date and time character into a date-time object in R.
#=========================================================================
dat_in<-read.table("./household_power_consumption.txt",sep=";",na.strings = "?", header=TRUE,stringsAsFactors = FALSE)
dat_subset<-dat_in[dat_in$Date %in% c("1/2/2007","2/2/2007"),]
date_time <- strptime(paste(dat_subset$Date, dat_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#=============================Plot & Save Graphic Device====================================
#Plot and save as bitmap graphic device in png format (plot2.png) with 480 by 480 pixels in size and transparent background. 
#Plot line graph of Global_active_power versus date_time with appropriate annotations 
#(y label, no title or x label required).Upon completion, graphic device is deactivated.
#===========================================================================================
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(date_time, dat_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()