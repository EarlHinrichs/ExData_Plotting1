getData<-function() {
        ##Data files are stored in the "data" directory off of getwd()
        ##Intermediate forms of the data are kept for inspection and for caching
            ##power.zip         : Original compressed file
            ##household_power_consumption.txt: Uncompressed raw data
            ##powerCooked.csv    : Full dataset, cleaned up for R
            ##powerSubset.csv        : Subset of interest, 2007-02-01 and 2007-02-02
    url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    powerZip<-"data\\power.zip"
    powerRaw <- "data\\household_power_consumption.txt"
    powerCooked <- "data\\powerCooked.data"
    powerSubset <- "data\\powerSubset.data"
        ## The first time this function runs, the data is copied from the internet,
        ## cleaned up to match R conventions, with the dates of interest extracted.
        ## On subsequent runs, we can go directly to the subsetted data.
    if( ! dir.exists("data") ) {
        dir.create("data")
    }
    if( ! file.exists(powerSubset) ) {          ##Skip the prep steps if the cooked subset is ready.
        if( ! file.exists(powerZip)) {          ##Download zip file, if necessary
            print("Downloading zip file from internet.")
            download.file(url,powerZip)
        }
        if( ! file.exists(powerRaw)) {          ##Extract raw data from zip
            print("Unzipping.")
            unzip(powerZip,exdir="data")
        }
        if( ! file.exists(powerCooked)) {       ##Cook the data
            print("Cooking the data.")
                ##Read raw data file, handle format idiosyncrasies
            fullData <- read.csv(powerRaw,sep=';',header=TRUE,na.strings = "?")
                ##Save cooked data
            write.csv(fullData,file=powerCooked)
        } else {
            print("Reading full data.")
            fullData <- read.csv(powerCooked, row.names = 1)
        }
        print("Generating data subset.")
        data <- fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]
        write.csv(data,powerSubset)
    }
        ##Load the data subset for our dates.
    data <- read.csv(powerSubset, row.names = 1)
        ##Add column of R friendly DateTimes
    data$DateTime = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S", tz="GMT")
    data
}
