
library(dplyr)
library(ggplot2)

data_1 <- read.csv("https://ndownloader.figshare.com/files/16851587")
data_2 <- read.csv("https://ndownloader.figshare.com/files/16851584")

data_1_Modified <- mutate(data_1, ratio = (cor.telson/cor.abdomen))

#telson/abdomen 
#lower ratio = telson and abdomen COR difference smaller
#higher ratio = telson and abdomen COR differece bigger (telson COR bigger)
