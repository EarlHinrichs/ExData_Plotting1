source("getData.R")           ##Look in the file getData.R for the shared data loading function
plot4 <- function() {
    data = getData();    ##data subset, with posix DateTime 
    png("plot4.png")
        ## four plots in a two by two arrangement
    par(mfrow = c(2, 2), mar = c(2,4,2,2), oma = c(0, 0, 0, 0))
        ## global active power
    plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
        ##voltage
    plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="")
        ##sub metering 1,2,3
    plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
    lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
    lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
    legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        ## global reactive power
    plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global Reactive Power",xlab="")    
    dev.off()
} 