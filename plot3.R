power<-read.table("./household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
headings<-read.table("./household_power_consumption.txt", sep=";", nrows=1, header=T)
colnames(power)<-colnames(headings)
power$Date<-as.Date(power$Date, format = "%d/%m/%Y")
DT<-paste(power$Date,power$Time)
DT<-as.POSIXct(DT)
power<-cbind(power,DT)
png(file="plot3.png")
with(power,plot(DT,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(DT,power$Sub_metering_2,type="l",col="Red")
lines(DT,power$Sub_metering_3,type="l",col="Blue")
# legend("topright",c(Sub_metering_1,Sub_metering_2,Sub_metering_3))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()