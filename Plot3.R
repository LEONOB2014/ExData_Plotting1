list.files()    # Verify the existence of the archive
Power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",quote = "", comment.char = "", na.strings = "?")    
head(Power)
dim(Power)
powerfeb  <- subset(Power, Date == "1/2/2007" | Date == "2/2/2007")
powerfeb
Conctiempo <- paste(powerfeb$Date, powerfeb$Time)
Newtime<- strptime(Conctiempo, "%d/%m/%Y %H:%M:%S")
class(Newtime)
NewPowerfeb <- cbind(Newtime,powerfeb)

png("plot3.png", width = 480, height = 480)
        plot(Newtime, NewPowerfeb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
        lines(Newtime, NewPowerfeb$Sub_metering_2, type ="l", col = "red")
        lines(Newtime, NewPowerfeb$Sub_metering_3, type ="l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))        

dev.off(

