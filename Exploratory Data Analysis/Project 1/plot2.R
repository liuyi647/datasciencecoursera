plot2 <- function(){
    myData <- read.table("household_power_consumption.txt", 
                         sep=";",
                         nrows=2880, 
                         skip=66637)
    
    names(myData) <- c("Date", "Time", "Global_active_power",
                        "Global_reactive_power", "Voltage",
                        "Global_intensity", "Sub_metering_1", 
                        "Sub_metering_2", "Sub_metering_3")
    
    myData <- within(myData, { 
            timestamp=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S")
        })
    
    for (i in 3:9) {
        myData[[i]] = as.numeric(as.character(myData[[i]]))}
    
    dev.off(dev.list()["RStudioGD"])
    
    plot(myData$timestamp, 
         myData$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    dev.copy(png, file = "plot2.png", width=480, height=480)
    dev.off()
}