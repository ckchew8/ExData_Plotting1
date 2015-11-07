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
#Plot and save as bitmap graphic device in png format (plot4.png) with 480 by 480 pixels in size and transparent background. 
#Appropriate annotation added to multiple plots.Consists of 4 subplots, 2 row and 2 columns setting used. 
#Each plot set to have margins of 5,4,4,2 lines in the sequence of bottom, left, top and right.
#Subplots are filled up column wise, from top to bottom.
#Plot 1 and Plot 2 details can be found from Plot2.R and Plot3.R script as they are a repetition. 
#Plot 1 has minor change from plot2.R whereby y label annotation is "Global Active Power" without quotes.
#Plot 3 is a line plot of Voltage versus Datetime whereas Plot 4 is a plot of Global_reactive_power versus date_time.
#Upon completion, graphic device is deactivated.
#===========================================================================================

png(filename = "plot4.png", width = 480, height = 480, units = "px" , bg="transparent")
par(mfcol=c(2,2)) 
par(mar=c(5,4,4,2))

#Plot 1 - Top Left
plot(date_time, dat_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plot 2 - Bottom Left
plot(date_time,dat_subset$Sub_metering_1 ,type="n",ylab="Energy sub metering",xlab="")
points(date_time,dat_subset$Sub_metering_1,type="l")
points(date_time,dat_subset$Sub_metering_2,type="l",col="red")
points(date_time,dat_subset$Sub_metering_3,type="l",col="blue")
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1, bty="n", cex=0.9)

#Plot 3 - Top Right
plot(date_time,dat_subset$Voltage,xlab="datetime",ylab="Voltage",type="l")

#Plot 4 - Bottom Right
plot(date_time,dat_subset$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()


