source("getData.R")           ##Look in the file getData.R for the shared data loading function
plot1 <- function() {
    data = getData();
    png("plot1.png")
    hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.off()
}