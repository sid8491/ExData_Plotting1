# read and store the data
datafile <- "household_power_consumption.txt"
data_all <- read.table(datafile, header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data_all$Time <- format(data_all$Time, format = "%H:%M:%S")
data <- subset(data_all, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
data$datetime <- as.POSIXct(paste(data$Date, data$Time))

# functions for all 4 plots
plot1 <- function(data) {
  plot(data$datetime, data$Global_active_power, type = "l",
       ylab = "Global Active Power", xlab = "")
}

plot2 <- function(data) {
  plot(data$datetime, data$Voltage, type = "l",
       ylab = "Voltage", xlab = "datetime")
}

plot3 <- function(data) {
  data$maxSubMeter <- apply(data[,7:9], 1, max)
  plot(data$datetime, data$maxSubMeter, type = "n",
       ylab = "Energy sub-metering", xlab = "")
  lines(data$datetime, data$Sub_metering_1, type = "l", col = "black")
  lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
  lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1));
}

plot4 <- function(data) {
  plot(data$datetime, data$Global_reactive_power, type = "l",
       ylab = "Global Reactive Power", xlab = "datetime")
}

# plot the graph
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot1(data)
plot2(data)
plot3(data)
plot4(data)
dev.off()
