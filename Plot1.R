#remove all variables
rm(list=ls()) 

#=============================Get Data====================================
#Data is assumed to be in current working directory.
#Read data in, data is separated by ";" without quotes, missing data is represented as "?" without quotes,
#use header information and do not convert strings to factors. obtain only data from 1/2/2007 and 2/2/2007.
#=========================================================================
dat_in<-read.table("./household_power_consumption.txt",sep=";",na.strings = "?", header=TRUE,stringsAsFactors = FALSE)
dat_subset<-dat_in[dat_in$Date %in% c("1/2/2007","2/2/2007"),]


#=============================Plot & Save Graphic Device====================================
#Plot and save as bitmap graphic device in png format (plot1.png) with 480 by 480 pixels in size and transparent background. 
#Plot histogram with appropriate annotations (title,x and y labels) distribution data of Global_active_power variable.
#y axis tick limits set to range between 0 to 1200 while x axis tick limits set to range from 0 to 6 with 3 intervals.
#xaxp argument changes axis tick spacing, xaxp=c(x1,x2,n), where x1 and x2 is the range and n is the number of intervals.
#The bars are filled with red color.Upon completion, graphic device is deactivated.
#===========================================================================================
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg="transparent")
hist(dat_subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0 ,1200), col="red",xaxp=c(0,6,3))
dev.off()