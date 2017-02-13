## The purpose of this script is to construct "Plot 4" as specified in the README file

# Set working directory to data set folder
setwd("~/Desktop/Coursera-Files/Course4")
electric_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subset the data set to the dates 2007-02-01 and 2007-02-02
electric_data[,1] <- as.Date(electric_data[,1], "%d/%m/%Y")
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
electric_data <- electric_data[electric_data$Date == start_date | electric_data$Date == end_date, ]

# Merging the date and time together for the plot's x-axis
date_time <- paste(as.Date(electric_data$Date), electric_data$Time)
electric_data$DateTime <- as.POSIXct(date_time)

## Create four-plot graph ##
electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))
electric_data$Sub_metering_1 <- as.numeric(as.character(electric_data$Sub_metering_1))
electric_data$Sub_metering_2 <- as.numeric(as.character(electric_data$Sub_metering_2))
electric_data$Sub_metering_3 <- as.numeric(as.character(electric_data$Sub_metering_3))
electric_data$Global_reactive_power <- as.numeric(as.character(electric_data$Global_reactive_power))
electric_data$Voltage <- as.numeric(as.character(electric_data$Voltage))
par(mfrow = c(2, 2))
# Plot from Plot 2 in upper left corner
plot(electric_data$DateTime, electric_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Plot in upper right corner
plot(electric_data$DateTime, electric_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Plot from Plot 3 in bottom left corner
plot(electric_data$DateTime, electric_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(electric_data$DateTime, electric_data$Sub_metering_2, col = "red")
lines(electric_data$DateTime, electric_data$Sub_metering_3, col = "blue")
legend("topright", "right", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", cex = 0.3)
# Plot in bottom right corner
plot(electric_data$DateTime, electric_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_Power")

# Set working directory to GitHub folder to create the PNG file
setwd("~/Desktop/Coursera-GitHub/ExData_Plotting1")

# Create the PNG file
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()