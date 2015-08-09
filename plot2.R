source("getData.R")           ##Look in the file getData.R for the shared data loading function
plot2 <- function() {
    data = getData();
    png("plot2.png")
    plot(data$DateTime,data$Global_active_power,type="l",main="Global Active Power",ylab="Global Active Power (kilowatts)",xlab="")
    dev.off()
}