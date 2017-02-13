## The purpose of this script is to construct "Plot 1" as specified in the README file

# Set working directory to data set folder
setwd("~/Desktop/Coursera-Files/Course4")
electric_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Subset the data set to the dates 2007-02-01 and 2007-02-02
electric_data[,1] <- as.Date(electric_data[,1], "%d/%m/%Y")
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
electric_data <- electric_data[electric_data$Date == start_date | electric_data$Date == end_date, ]

# Create red histogram with the title "Global Active Power" and x-axis title "Global Active Power (killowats)
electric_data$Global_active_power <- as.numeric(as.character(electric_data$Global_active_power))
hist(electric_data$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", col = "red")

# Set working directory to GitHub folder to create the PNG file
setwd("~/Desktop/Coursera-GitHub/ExData_Plotting1")

# Create the PNG file
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()