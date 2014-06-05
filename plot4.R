# Course Project 1
# The program creates plot4.png as output
# The graph shows 4 plots in a single image
# The input data (household_power_consumption.txt) is in the working directory

# Read input data
#  2075259 (num. of rows) * (74) ~ 146.454 MB required to read the file
inData <- read.table("household_power_consumption.txt", sep=";",header=TRUE)

# Convert 'Date' variable to date data type
inData$Date <- as.Date(strptime(inData$Date, "%d/%m/%Y"))

# Subset data only for 02/01/2007 and 02/02/2007
subData <- subset(inData, Date > as.Date("2007-01-31") & Date < as.Date("2007-02-03"))
subData$Date2 <- as.POSIXct(strptime(paste(as.character(subData$Date), subData$Time), "%Y-%m-%d %H:%M:%S"))

#initialize device - output parameters set
png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")


# Intialize a graph with 2 rows and 2 columns for plots
par(mfrow=c(2,2))

#*************   PLOT 1   *************************************************************
plot(subData$Date2, as.numeric(as.character(subData$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
# X-axis
axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))
# Y- axis
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200))


#*************   PLOT 2   *************************************************************
plot(subData$Date2, as.numeric(as.character(subData$Voltage)), type="l", xlab="datetime", ylab="Voltage")


#*************   PLOT 3   *************************************************************

plot(subData$Date2, as.numeric(as.character(subData$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")

lines(subData$Date2, as.numeric(as.character(subData$Sub_metering_2)), col="red")
lines(subData$Date2, as.numeric(as.character(subData$Sub_metering_3)), col="blue")


legend(x="topright",y=NULL, # places a legend at the appropriate place 
c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
lty=c(1,1,1), # gives the legend appropriate symbols (lines)
lwd=c(2,2,2),col=c("black","red","blue"), bty="n") # gives the legend lines the correct color and width

#*************   PLOT 4   *************************************************************


plot(subData$Date2, as.numeric(as.character(subData$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")


# Close device
dev.off()

# Clear memory
rm(list=ls())