#Reading data
hpc <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")

hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")


#Extracting records only for dates 2007-02-01 and 2007-02-02.
hpc_subset <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

#Plotting the grap
png(file="plot2.png",width = 480, height = 480, units = "px")
plot(x=hpc_subset$DateTime, 
     y=hpc_subset$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()