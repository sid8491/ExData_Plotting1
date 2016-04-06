# read and store the data
datafile <- "household_power_consumption.txt"
data_all <- read.table(datafile, header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data_all$Time <- format(data_all$Time, format = "%H:%M:%S")
data <- subset(data_all, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))


# plot the graph
png(filename = "plot3.png", width = 480, height = 480)
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
data$maxSubMeter <- apply(data[,7:9], 1, max)
plot(data$datetime, data$maxSubMeter, 
     main = "Energy Sub Metering", type = "n",
     ylab = "Energy sub-metering", xlab = "")
lines(data$datetime, data$Sub_metering_1, type = "l", col = "black")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1));
dev.off()
