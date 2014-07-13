hpc <- read.table(pipe('grep "^[1-2]/2/2007" "C:/Documents and Settings/wei/Rfiles/household_power_consumption.txt"'), 
                  header = F, sep = ";")
colnames(hpc) <- names(read.table('household_power_consumption.txt', header = T, 
                                  sep = ";", nrows = 1))
png(file = "plot2.png")
with(hpc, plot(Global_active_power, type = "l", xaxt = "n", xlab = "", 
               ylab = "Global Active Power(Kilowatts)"))
axis(1, at = c(1, nrow(hpc)/2, nrow(hpc)), labels = c("Thu", "Fri", "Sat"))
dev.off()