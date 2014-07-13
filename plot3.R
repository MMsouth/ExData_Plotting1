hpc <- read.table(pipe('grep "^[1-2]/2/2007" "C:/Documents and Settings/wei/Rfiles/household_power_consumption.txt"'), 
                  header = F, sep = ";")
colnames(hpc) <- names(read.table('household_power_consumption.txt', header = T, 
                                  sep = ";", nrows = 1))
png(file = "plot3.png")
with(hpc, plot(Sub_metering_1, type = "l", xaxt = "n", xlab = "", 
               ylab = "Energy sub metering"))
with(hpc, points(Sub_metering_2, type = "l", col = "red"))
with(hpc, points(Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=c(1, 1, 1), lwd=c(2.5, 2.5, 2.5),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"))
dev.off()