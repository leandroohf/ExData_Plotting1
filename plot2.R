
#fname <- file.choose()
fname <- "./household_power_consumption.txt"

house_data <- read.csv2(fname,header=TRUE, na.string="?")

#  -------------------------------------------- [ Mugging Data ]

house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")

house_data_subset <- subset(house_data,house_data$Date == "2007-02-01" | house_data$Date == "2007-02-02" )


house_data_subset$Global_active_power <- as.numeric(as.character(house_data_subset$Global_active_power))

d <- strptime(paste(house_data_subset$Date,house_data_subset$Time),format="%Y-%m-%d %H:%M:%S")

#  ------------------------------------------------ [ Plotting ]

png(file="./figure/plot2.png", width = 480, height = 480)
plot(d,house_data_subset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
