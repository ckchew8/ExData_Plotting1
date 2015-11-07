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
#Plot and save as bitmap graphic device in png format (plot3.png) with 480 by 480 pixels in size and transparent background. 
#Appropriate y label assigned while no x label or title required. Withheld data from plotting using type="n" argument.
#Line plot added sequentially for Sub_metering_1, Sub_metering_2 and Sub_metering_3 represented with different colors.
#Legend is added at the top right annotated with appropriate name and line color with a limited size. 
#Upon completion, graphic device is deactivated.
#===========================================================================================
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
plot(date_time,dat_subset$Sub_metering_1 ,type="n",ylab="Energy sub metering", xlab="")
points(date_time,dat_subset$Sub_metering_1,type="l",col="black")
points(date_time,dat_subset$Sub_metering_2,type="l",col="red")
points(date_time,dat_subset$Sub_metering_3,type="l",col="blue")
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1, cex=0.8)
dev.off()