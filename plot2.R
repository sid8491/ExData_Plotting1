# read and store the data
datafile <- "household_power_consumption.txt"
data_all <- read.table(datafile, header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data_all$Time <- format(data_all$Time, format = "%H:%M:%S")
data <- subset(data_all, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))


# plot the graph
png(filename = "plot2.png", width = 480, height = 480)
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
plot(data$datetime, data$Global_active_power, 
     main = "Global Active Power", type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "Day of the week")
dev.off()
