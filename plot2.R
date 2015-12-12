library("lubridate")
oldwd <- getwd()
setwd("d:/Dokumente/R/ExDataA1")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data$Date <- dmy(data$Date)
dt <- data[data$Date>=mdy("2/1/2007") & data$Date<=mdy("2/2/2007"),]
dt$DateTime <- dt$Date+hms(dt$Time)

plot(dt$DateTime, dt$Global_active_power, type="l", col="black", main="", xlab="", ylab="Global Active Power (kilowatts)" )

dev.copy(png, "plot2.png", width=480, height=480)
dev.off()

setwd(oldwd)
