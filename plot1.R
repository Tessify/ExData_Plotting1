# Load data
X <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
X <- X[X$Date == "1/2/2007"| X$Date == "2/2/2007", ]

# Convert variables if necessary
X$Global_active_power <- as.numeric(as.character(X$Global_active_power))

# Create and save plot to PNG file
png(filename = "plot1.png")
hist(X$Global_active_power, main = "Global Active Power", 
     xlab = "Globel Active Power (kilowatts)",
     col = "red")
dev.off()

