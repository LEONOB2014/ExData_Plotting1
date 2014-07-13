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

png("plot2.png", width = 480, height = 480)
        plot(Newtime, NewPowerfeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

