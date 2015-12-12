library("lubridate")
oldwd <- getwd()
setwd("d:/Dokumente/R/ExDataA1")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data$Date <- dmy(data$Date)
dt <- data[data$Date>=mdy("2/1/2007") & data$Date<=mdy("2/2/2007"),]

hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()

setwd(oldwd)
