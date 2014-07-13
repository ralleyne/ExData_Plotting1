# requires that the data file be downloaded unzipped in a the same folder as
# this script
data<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("?"))
# fix dates
data$Date<-as.Date(as.character(data$Date), format="%d/%m/%Y")
high.date <- as.Date("2007-02-02", format = "%Y-%m-%d")
low.date <- as.Date("2007-02-01", format = "%Y-%m-%d")

#filter out uneeded dates
data_in_range<-data[data$Date>=low.date&data$Date<=high.date,]

#include time and dates together
data_in_range$Date<-strptime(paste(data_in_range$Date,as.character(data_in_range$Time), sep =" "), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")
with(data_in_range, plot(data_in_range$Date,as.numeric(data_in_range$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off() 
