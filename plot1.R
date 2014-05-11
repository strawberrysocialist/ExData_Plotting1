#Get data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_file<-"./exdata-data-household_power_consumption.zip"
download.file(url,data_file)
if (!file.exists(data_file)) {
  stop("Unable to download the data file.")
}
unzip(data_file)
data_file<-"./household_power_consumption.txt"
if (!file.exists(data_file) {
  stop("Unable to unzip the data file.")
}
#Load data
power<-read.table("household_power_consumption.txt",
                  header=T,sep=";",na.strings="?",
                  stringsAsFactors=F)
#Limit it to appropriate days
power<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
#Fix date and time columns
power$Time<-strptime(paste(power$Date, power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date<-as.Date(power$Date,format="%d/%m/%Y")
#Plot the histogram
hist(power$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     axes=F)
axis(2,at=seq(from=0,to=1200,by=200),labels=T)
axis(1,at=seq(from=0,to=6,by=2),labels=T)
#Save the plot to a file
png("plot1.png",width=480,height=480,bg="transparent")
hist(power$Global_active_power,
     col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
