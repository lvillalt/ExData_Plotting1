## Code for plot2
## Can be run using source("plot2.R") if the file is in current working directory

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
		
## We finally plot the time-series plot to a *.png file		

	png(filename="plot2.png", width=480, height=480)
	
	plot(household_plot_data$DateTime,household_plot_data$Global_active_power, 
		type="l", xlab="", ylab="Global Active Power (kilowatts)")
		
	dev.off()