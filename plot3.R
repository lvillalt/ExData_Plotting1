## Code for plot3
## Can be run using source("plot3.R") if the file is in current working directory

## We first read the *.csv file. (Note that the separator is a semicolon)
##
## The colClasses parameter is used here to make sure that the date and time
## columns are read as character type, so that we can be ready to convert to
## DateTime objects

	household <- read.csv(file="household_power_consumption.txt", sep=";", 
		colClasses = c("character", "character", "numeric", "numeric","numeric",
		"numeric","numeric", "numeric", "numeric" ), na.strings="?")

## We now convert the Date and Time columns into the proper format	
		
	DateTime <- paste(household$Date, household$Time)
	DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
	
## We create a new object for the DateTime format		
	
	household.DateTime <- cbind(DateTime, household)

## And eliminate the original columns	
	
	household.DateTime$Date <- NULL
	household.DateTime$Time <- NULL

## Subset the data to be within the dates specified			
	
	household_plot_data <- household.DateTime[(
		(household.DateTime$DateTime>"2007-01-31 23:59:00")
		&(household.DateTime$DateTime<"2007-02-03 00:00:00")),]

## We finally plot the annotated time-series plot to a *.png file	
## Note how additional lines are added with the lines function
##  and line color is changed with parameters there. A legend is added.			

	png(filename="plot3.png", width=480, height=480)
	
		plot(household_plot_data$DateTime,household_plot_data$Sub_metering_1, 
			type="l", xlab="", ylab="Energy sub metering")
		
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_2, col="red")
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_3, col="blue")

		legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
			"Sub_metering_3"), lty = 1,col = c("black", "red", "blue"))
		
	dev.off()
	