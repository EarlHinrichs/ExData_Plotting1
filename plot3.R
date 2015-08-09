source("getData.R")           ##Look in the file getData.R for the shared data loading function
plot3 <- function() {
    data = getData();
    png("plot3.png")
    plot(data$DateTime,data$Sub_metering_1,type="l",main="Energy sub metering",ylab="Energy sub metering",xlab="",col="black")
    lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
    lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
    legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    dev.off()
}