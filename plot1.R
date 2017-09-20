#Reading data
hpc <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")

#Extracting records only for dates 2007-02-01 and 2007-02-02.
library(sqldf)
hpc$Date <- as.character(hpc$Date)
hpc_subset <- sqldf("select * from hpc where Date in ('1/2/2007','2/2/2007')")

#Plotting the grap
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(as.numeric(hpc_subset$Global_active_power),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()