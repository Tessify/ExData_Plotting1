# Load data
X <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
X <- X[X$Date == "1/2/2007"| X$Date == "2/2/2007", ]

# Convert variables if necessary
X$Date <- strptime(X$Date, format = "%d/%m/%Y")
X$DT <- X$Date + (as.numeric(X$Time)) * 60 - 1
X$Global_active_power <- as.numeric(as.character(X$Global_active_power))

# Create and save plot to PNG file
Sys.setlocale("LC_ALL", "English")
png(filename = "plot2.png")
plot(X$DT, X$Global_active_power,
     ylab = "Globel Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.off()

