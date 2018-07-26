# Load data
X <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
X <- X[X$Date == "1/2/2007"| X$Date == "2/2/2007", ]

# Convert variables if necessary
X$Date <- strptime(X$Date, format = "%d/%m/%Y")
X$DT <- X$Date + (as.numeric(X$Time)) * 60 - 1
X$Sub_metering_1 <- as.numeric(as.character(X$Sub_metering_1))
X$Sub_metering_2 <- as.numeric(as.character(X$Sub_metering_2))
X$Sub_metering_3 <- as.numeric(as.character(X$Sub_metering_3))

# Create and save plot to PNG file
Sys.setlocale("LC_ALL", "English")
png(filename = "plot3.png")
plot(X$DT, X$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab = "",
     type = "n")
lines(X$DT, X$Sub_metering_1, col = "black")
lines(X$DT, X$Sub_metering_2, col = "red")
lines(X$DT, X$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

