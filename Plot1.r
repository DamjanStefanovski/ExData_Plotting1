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
# Convert time
chart_electricalPowerConsumption$timestamp <- strptime(
        paste(
                chart_electricalPowerConsumption$Date, 
                chart_electricalPowerConsumption$Time),
        format = "%d/%m/%y %H:%M:%S")

# Launch png and create file
png(filename = "plot1.png",
    height = 480,
    width = 480)

# Common code ends here

# Create histogram
hist(chart_electricalPowerConsumption$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
