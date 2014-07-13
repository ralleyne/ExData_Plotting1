# requires that the data file be downloaded unzipped in a the same folder as
# this script
data<-read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("?"))
data$Date<-as.Date(as.character(data$Date), format="%d/%m/%Y")

high.date <- as.Date("2007-02-02", format = "%Y-%m-%d")
low.date <- as.Date("2007-02-01", format = "%Y-%m-%d")
data_in_range<-data[data$Date>=low.date&data$Date<=high.date,]
png("plot1.png", width = 480, height = 480, units = "px")
with(data_in_range, hist(as.numeric(data_in_range$Global_active_power), 
                        main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="Red"))
dev.off() 
