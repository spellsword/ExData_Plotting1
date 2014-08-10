plot3<- function(){
  
raw<- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
data <- raw[66636:69517, ]


data[,1] <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1]<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,2]<-NULL

data[,6] <- as.character(data[,6])
data[,6] <- as.numeric(data[,6])

data[,7] <- as.character(data[,7])
data[,7] <- as.numeric(data[,7])

data[,8] <- as.character(data[,8])
data[,8] <- as.numeric(data[,8])


png("plot3.png", width = 480, height = 480)
par(bg="transparent")
plot(range(data[,1]), range(data[,6]),type = "n", xlab = "", ylab = "Energy sub metering")
lines(data[,1], data[,6], type = "l")
lines(data[,1], data[,7], type = "l", col="red")
lines(data[,1], data[,8], type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd=c(1.5,1.5,1.5), col=c("black","red","blue"))

dev.off()
}