plot1<- function(){
  
raw<- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
data <- raw[66636:69517, ]

data[,1] <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1]<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data[,2]<-NULL

data[,2] <- as.character(data[,2])
data[,2]<-as.numeric(data[,2])


png("plot1.png", width = 480, height = 480)
hist(data[,2], , xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

dev.off()

}