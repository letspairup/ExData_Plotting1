# Code for course-4 "Exploratory Data Analysis"
# Author: #letspairup

library(dplyr)

epc.data <- read.csv2("household_power_consumption.txt", na.strings = "?") %>% 
    filter(Date=='1/2/2007' | Date=='2/2/2007') %>% 
    select(Date, Time, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3) %>%
    mutate(Date = strptime(paste(sep=" ",Date, Time), "%d/%m/%Y %H:%M:%S"), 
           Global_active_power = as.numeric(Global_active_power),
           Global_reactive_power = as.numeric(Global_reactive_power),
           Voltage = as.numeric(Voltage),
           Sub_metering_1 = as.numeric(Sub_metering_1),
           Sub_metering_2 = as.numeric(Sub_metering_2),
           Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    select(Date, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3)

png("plot4.png", width=900, height=700)

par(mfrow=c(2,2))

# P1
with(epc.data, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power")) 

# P2
with(epc.data, plot(Date, Voltage, type="l", xlab="Date", ylab="Voltage"))

# P3
with(epc.data, plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering"))
with(epc.data, lines(Date, Sub_metering_2, col="red"))
with(epc.data, lines(Date, Sub_metering_3,col="blue"))

legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# P4
with(epc.data, plot(Date, Global_reactive_power, type="l", xlab="Date", ylab="Global_Reactive_Power"))

dev.off()
