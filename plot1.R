
#fname <- file.choose()
fname <- "./household_power_consumption.txt"

house_data <- read.cvs2(fname,header=TRUE)

# mugging data

house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")

house_data_subset <- subset(house_data,house_data$Date == "2007-02-01" | house_data$Date == "2007-02-02" )

# dealing with '?'= NA 
house_data_subset$Global_active_power[ house_data_subset$Global_active_power == "?"] <- NA

#length (house_data_subset$Global_active_power[house_data_subset$Global_active_power == "?"])

house_data_subset$Global_active_power <- as.numeric(house_data_subset$Global_active_power)

hist(house_data_subset$Global_active_power*2/1e3,col="red",main="Global Active Power",xlab="Global Active Power",ylab="Frequency")
