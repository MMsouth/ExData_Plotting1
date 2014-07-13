hpc <- read.table(pipe('grep "^[1-2]/2/2007" "C:/Documents and Settings/wei/Rfiles/household_power_consumption.txt"'), 
                  header = F, sep = ";")
colnames(hpc) <- names(read.table('household_power_consumption.txt', header = T, 
                  sep = ";", nrows = 1))
png(file = "plot1.png")
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.off()