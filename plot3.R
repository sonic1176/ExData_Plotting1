library("lubridate")
oldwd <- getwd()
setwd("d:/Dokumente/R/ExDataA1")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data$Date <- dmy(data$Date)
dt <- data[data$Date>=mdy("2/1/2007") & data$Date<=mdy("2/2/2007"),]
dt$DateTime <- dt$Date+hms(dt$Time)

plot(dt$DateTime, dt$Sub_metering_1, type="l", col="black", main="", xlab="", ylab="Energy sub metering")
lines(dt$DateTime, dt$Sub_metering_2, col="red")
lines(dt$DateTime, dt$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width=480, height=480)
dev.off()

setwd(oldwd)
