# Exploratory Data Analysis
# Course Project 1
# Code file to create Plot 3 - Line plots of Energy Sub Metering


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
png(file = "plot3.png", width = 480, height = 480, units = "px")

# line plots of Energy Sub Metering by time
with(powerData, plot(dateTime, Sub_metering_1,
                     col = "black",
                     type = "l",
                     xlab = "Day of the week",
                     ylab = "Energy sub metering"))

with(powerData, points(dateTime, Sub_metering_2,
                       col = "red",
                       type = "l"))

with(powerData, points(dateTime, Sub_metering_3,
                       col = "blue",
                       type = "l"))

legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"))

# close the PNG device
dev.off()
