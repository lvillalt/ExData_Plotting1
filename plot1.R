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

	png(filename="plot1.png", width=480, height=480)
	
	hist(household_plot_data$Global_active_power, main = "Global Active Power", 
		ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)", col="red")
		
	dev.off()