
#fname <- file.choose()
#fname <- "~/Documents/coursera/Exploratory Data Analysis/Projects/ExData_Plotting1/household_power_consumption.txt"
fname <- "./household_power_consumption.txt"

house_data <- read.csv2(fname,header=TRUE, na.string="?")

#  -------------------------------------------- [ Mugging Data ]

house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")

house_data_subset <- subset(house_data,house_data$Date == "2007-02-01" | house_data$Date == "2007-02-02" )

house_data_subset$Global_active_power <- as.numeric(as.character(house_data_subset$Global_active_power))
house_data_subset$Global_reactive_power <- as.numeric(as.character(house_data_subset$Global_reactive_power))
house_data_subset$Voltage <- as.numeric(as.character(house_data_subset$Voltage))

house_data_subset$Sub_metering_1 <- as.numeric(as.character(house_data_subset$Sub_metering_1))
house_data_subset$Sub_metering_2 <- as.numeric(as.character(house_data_subset$Sub_metering_2))
house_data_subset$Sub_metering_3 <- as.numeric(as.character(house_data_subset$Sub_metering_3))

d <- strptime(paste(house_data_subset$Date,house_data_subset$Time),format="%Y-%m-%d %H:%M:%S")

#  ------------------------------------------------ [ Plotting ]

png(file="./figure/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(d,house_data_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(d,house_data_subset$Voltage,type="l",xlab="datetime",ylab="Voltage")

sub1 <- house_data_subset$Sub_metering_1
plot(d,sub1,type="l",xlab="",ylab="Energy sub metring ")

sub2 <- house_data_subset$Sub_metering_2
lines(d,sub2,type="l",col="red")

sub3 <- house_data_subset$Sub_metering_3
lines(d,sub3,type="l",col="blue")
legend("topright", lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(d,house_data_subset$Global_reactive_power,type="l",cex=1,xlab="datetime",ylab="Globar_reactive_power")

dev.off()
