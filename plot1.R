# Code for course-4 "Exploratory Data Analysis"
# Author: #letspairup

library(dplyr)

epc.data <- read.csv2("household_power_consumption.txt", na.strings = "?") %>% 
    filter(Date=='1/2/2007' | Date=='2/2/2007') %>% select(Date, Time, Global_active_power) %>%
    mutate(Date = strptime(paste(sep=" ",Date, Time), "%d/%m/%Y %H:%M:%S"), Global_active_power = as.numeric(Global_active_power)) %>%
    select(Date, Global_active_power)

png("plot1.png", width=500, height=500)

hist(epc.data$Global_active_power, breaks = 12, 
     col = "red", xlab = "Global Active Power (KW)", main="Global Active Power")

dev.off()
