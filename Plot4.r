electricPowerConsumption <- read.table("household_power_consumption.txt",
                                       header = TRUE,
                                       sep = ";",
                                       colClasses = c(rep("character",2),
                                                      rep("numeric", 7)),
                                       na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
# You may find it useful to convert the Date and Time variables to 
# Date/Time classes in R using the ????????????????????????????????()  and ????????.????????????????() functions.

# Select dates
chart_electricalPowerConsumption <- subset(electricPowerConsumption,
                                           electricPowerConsumption$Date 
                                           %in% c("1/2/2007", "2/2/2007"))

chart_electricalPowerConsumption$timestamp <- strptime(
        paste(
                chart_electricalPowerConsumption$Date, 
                chart_electricalPowerConsumption$Time),
        format = "%d/%m/%Y %H:%M:%S")

# Launch png and create file
png(filename = "plot4.png",
    height = 480,
    width = 480)

# Common code ends here.
par(mfrow = c(2, 2),
    mar = c(4, 4, 2, 1),
    oma = c(0, 0, 2, 0))

with(chart_electricalPowerConsumption,{
        plot(chart_electricalPowerConsumption$timestamp,
             chart_electricalPowerConsumption$Global_active_power,
             type = "l", 
             xlab = "", 
             ylab = "Global Active Power (kilowatts)")
        plot(chart_electricalPowerConsumption$timestamp,
             chart_electricalPowerConsumption$Voltage,
             type = "l",
             xlab = "voltage",
             ylab = "date/time")
        plot(chart_electricalPowerConsumption$timestamp,
             chart_electricalPowerConsumption$Sub_metering_1,
             type = "l", 
             xlab = "", 
             ylab = "Energy Sub Meeting")
        
        lines(chart_electricalPowerConsumption$timestamp, 
              chart_electricalPowerConsumption$Sub_metering_2,
              col = "red")
        
        lines(chart_electricalPowerConsumption$timestamp,
              chart_electricalPowerConsumption$Sub_metering_3,
              col = "blue")
        
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"),
               border = "black",
               lty = c(1, 1))
        
        plot(chart_electricalPowerConsumption$timestamp,
             chart_electricalPowerConsumption$Global_reactive_power,
             type = "l",
             xlab = "datetime",
             ylab = "Global_reactive_power")
        
})

dev.off()