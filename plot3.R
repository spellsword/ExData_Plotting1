plot3<- function(){
  
raw<- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
data <- raw[66636:69517, ]


data[,1] <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1]<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,2]<-NULL

data[,2] <- as.character(data[,2])
data[,2] <- as.numeric(data[,2])


png("plot3.png", width = 480, height = 480)
plot(range(data[,1]), range(1:33),type = "n", xlab = "", ylab = "energy submetering")
lines(data[,1], data[,6], type = "l")
lines(data[,1], data[,7], type = "l", col="red")
lines(data[,1], data[,8], type = "l", col="blue")
legend("topright", legend = c("energy submetering_1", "energy submetering_2","energy submetering_3"), lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

dev.off()
}