dataframe <- read.csv("~/LR_5/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]

cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]

hist(plotdata, col="red", xlab="Global Active Pover (kilowatts)", main="Global Active Pover")

dev.copy(device = png, filename = '~/LR_5/Plot1.png', width = 480, height = 480)
dev.off ()