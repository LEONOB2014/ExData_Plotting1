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

png("plot1.png", width = 480, height = 480)
        hist(NewPowerfeb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
