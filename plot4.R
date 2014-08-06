
	household_plot_data <- household.DateTime[(
		(household.DateTime$DateTime>"2007-01-31 23:59:00")
		&(household.DateTime$DateTime<"2007-02-03 00:00:00")),]
		
	png(filename="plot4.png", width=480, height=480)
	
		par(mfrow=c(2,2))
		
		plot(household_plot_data$DateTime,household_plot_data$Global_active_power, 
			type="l", xlab="", ylab="Global Active Power")
 
		plot(household_plot_data$DateTime,household_plot_data$Voltage, 
			type="l", ylab="Voltage", xlab="datetime")
 
		plot(household_plot_data$DateTime,household_plot_data$Sub_metering_1, 
			type="l", xlab="", ylab="Energy sub metering")
			
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_2, col="red")
		lines(household_plot_data$DateTime,household_plot_data$Sub_metering_3, col="blue")
 
		legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
			lty = 1, bty="n" , col = c("black", "red", "blue"))

		plot(household_plot_data$DateTime,household_plot_data$Global_reactive_power, 
			type="l",ylab="Global_reactive_power",  xlab="datetime")

		par(mfrow=c(1,1))
		
	dev.off()
