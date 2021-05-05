# Code for course-4 "Exploratory Data Analysis"
# Author: #letspairup

library(dplyr)

epc.data <- read.csv2("household_power_consumption.txt", na.strings = "?") %>% 
    filter(Date=='1/2/2007' | Date=='2/2/2007') %>% select(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3) %>%
    mutate(Date = strptime(paste(sep=" ",Date, Time), "%d/%m/%Y %H:%M:%S"), 
           Sub_metering_1 = as.numeric(Sub_metering_1),
           Sub_metering_2 = as.numeric(Sub_metering_2),
           Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    select(Date, Sub_metering_1, Sub_metering_2, Sub_metering_3)

png("plot3.png", width=800, height=600)

with(epc.data, plot(Date, Sub_metering_1,
                    type="l", xlab="", ylab="Energy Sub Metering"))

with(epc.data, lines(Date, Sub_metering_2, col="red"))
with(epc.data, lines(Date, Sub_metering_3, col="blue"))

legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1 ","Sub_metering_2", "Sub_metering_3")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
