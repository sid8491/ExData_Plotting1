# read and store the data
datafile <- "household_power_consumption.txt"
data_all <- read.table(datafile, header = T, sep = ";", stringsAsFactors = F, dec = ".", na.strings = "?")
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")
data_all$Time <- format(data_all$Time, format = "%H:%M:%S")
data <- subset(data_all, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))


# plot the graph
png(filename = "plot1.png", width = 480, height = 480)
hist(x = data$Global_active_power, col = "red", xlab =  "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power")
dev.off()
