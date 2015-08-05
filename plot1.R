# Exploratory Data Analysis
# Course Project 1
# Code file to create Plot 1 - Histogram of Global Active Power


# read the data file from the current working directory
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# convert Date variable to data class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# subset the data to a specified date range
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
powerData <- subset(df, df$Date >= startDate & df$Date <= endDate)

# add a new combined Date and Time variable
powerData$dateTime <- strptime(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")

# convert other variables to numeric values
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
powerData$Global_reactive_power <- as.numeric(powerData$Global_reactive_power)
powerData$Voltage <- as.numeric(powerData$Voltage)
powerData$Global_intensity <- as.numeric(powerData$Global_intensity)
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1)
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2)
powerData$Sub_metering_3 <- as.numeric(powerData$Sub_metering_3)

# open the PNG device; create file in current working directory
png(file = "plot1.png", width = 480, height = 480, units = "px")

# plot histogram of Global Active Power
hist(powerData$Global_active_power,
     col = "Red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# close the PNG device
dev.off()
