	household <- read.csv(file="household_power_consumption.txt", sep=";", 
		colClasses = c("character", "character", "numeric", "numeric","numeric",
		"numeric","numeric", "numeric", "numeric" ), na.strings="?")
	
	DateTime <- paste(household$Date, household$Time)
	DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
	
	household.DateTime <- cbind(DateTime, household)
	
	household.DateTime$Date <- NULL
	household.DateTime$Time <- NULL

	household_plot_data <- household.DateTime[(
		(household.DateTime$DateTime>"2007-01-31 23:59:00")
		&(household.DateTime$DateTime<"2007-02-03 00:00:00")),]
		

	png(filename="plot3.png", width=480, height=480)
	
		plot(household_plot_data$DateTime,household_plot_data$Sub_metering_1, 
			type="l", xlab="", ylab="Energy sub metering")
		
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_2, col="red")
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_3, col="blue")

		legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
			"Sub_metering_3"), lty = 1,col = c("black", "red", "blue"))
		
	dev.off()
	
