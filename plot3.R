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
#Plot the time graph
x<-power$Time
y1<-power$Sub_metering_1
y2<-power$Sub_metering_2
y3<-power$Sub_metering_3
plot(x,y1,ylab="Energy sub metering",xlab="",type="n")
lines(x,y1,type="l",col="black")
lines(x,y2,type="l",col="red")
lines(x,y3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Save the plot to a file
png("plot3.png",width=480,height=480,bg="white")
x<-power$Time
y1<-power$Sub_metering_1
y2<-power$Sub_metering_2
y3<-power$Sub_metering_3
plot(x,y1,ylab="Energy sub metering",xlab="",type="n")
lines(x,y1,type="l",col="black")
lines(x,y2,type="l",col="red")
lines(x,y3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
