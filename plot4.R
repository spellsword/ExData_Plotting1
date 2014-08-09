plot4<- function(){
  
raw<- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
data <- raw[66636:69517, ]


data[,1] <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1]<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,2]<-NULL

data[,2] <- as.character(data[,2])
data[,2] <- as.numeric(data[,2])

data$Voltage <- as.character(data$Voltage)
data$Voltage<-as.numeric(data$Voltage)

data[,3] <- as.character(data[,3])
data[,3]<-as.numeric(data[,3])

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data[,1], data[,2], type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
plot(data[,1], data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(range(data[,1]), range(1:33),type = "n", xlab = "", ylab = "Energy sub metering")
lines(data[,1], data[,6], type = "l")
lines(data[,1], data[,7], type = "l", col="red")
lines(data[,1], data[,8], type = "l", col="blue")
legend("topright", legend = c("submetering_1", "submetering_2","submetering_3"), lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"), bty = "n")
plot(data[,1], data[,3], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
}