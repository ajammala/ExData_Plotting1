# Course Project 1
# The program creates plot1.png as output
# The graph shows a histogram of the Global Active Power variable
# The input data (household_power_consumption.txt) is in the working directory

# Read input data
#  2075259 (num. of rows) * (74) ~ 146.454 MB required to read the file
inData <- read.table("household_power_consumption.txt", sep=";",header=TRUE)

# Convert 'Date' variable to date data type
inData$Date <- as.Date(strptime(inData$Date, "%d/%m/%Y"))

# Subset data only for 02/01/2007 and 02/02/2007
subData <- subset(inData, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))

#initialize device - output parameters set
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# Plot graph
hist(as.numeric(as.character(subData$Global_active_power)),
col="red",
xlim = c(0, 6),
ylim = c(0, 1200), 
main= "Global Active Power", 
xlab="Global Active Power (kilowatts)",
xaxt='n',
yaxt='n')

# X-axis
axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))

# Y- axis
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200))

# Close device
dev.off()

# Clear memory
rm(list=ls())