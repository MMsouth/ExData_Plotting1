## read and format data
hpc <- read.table(pipe('grep "^[1-2]/2/2007" "C:/Documents and Settings/wei/Rfiles/household_power_consumption.txt"'), 
                  header = F, sep = ";")
colnames(hpc) <- names(read.table('household_power_consumption.txt', header = T, 
                                  sep = ";", nrows = 1))

png(file = "plot4.png")
par(mfrow = c(2, 2))

## plot first panel
with(hpc, plot(Global_active_power, type = "l", xaxt = "n", xlab = "", 
               ylab = "Global Active Power", cex.lab = 0.75))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"), cex.lab = 0.5)

## plot second panel
with(hpc, plot(Voltage, type = "l", xaxt = "n", xlab = "datetime", 
               ylab = "Voltage", cex.lab = 0.75))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

## plot third panel
with(hpc, plot(Sub_metering_1, type = "l", xaxt = "n", xlab = "", 
               ylab = "Energy sub metering", cex.lab = 0.75))
with(hpc, points(Sub_metering_2, type = "l", col = "red"))
with(hpc, points(Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=c(1, 1, 1), 
       lwd=c(1.5, 1.5, 1.5), cex = 0.75, bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

## plot fourth panel
with(hpc, plot(Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", 
               ylab = "Global_reactive_power", cex.lab = 0.75))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"))

dev.off()