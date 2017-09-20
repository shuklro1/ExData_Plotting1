
#Reading data
hpc <- read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?")

#Concatinating Date & Time column and converting the result to DateTime format
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

#Extracting records only for dates 2007-02-01 and 2007-02-02.
hpc_subset <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

#Plotting the grap
png(file="plot3.png",width = 480, height = 480, units = "px")

plot(hpc_subset$DateTime, hpc_subset$Sub_metering_1,type = "l",lwd=1,lty=1,col="black",ylab = "Energy Sub Metering",xlab = "")
lines(hpc_subset$DateTime, hpc_subset$Sub_metering_2,type = "l",lwd=1,lty=1,col="red")
lines(hpc_subset$DateTime, hpc_subset$Sub_metering_3,type = "l",lwd=1,lty=1,col="blue")
legend("topright", pch = "_", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()