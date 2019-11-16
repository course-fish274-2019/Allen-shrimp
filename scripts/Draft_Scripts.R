
library(dplyr)
library(ggplot2)

data_1 <- read.csv("https://ndownloader.figshare.com/files/16851587")
data_2 <- read.csv("https://ndownloader.figshare.com/files/16851584")

data_1_modified <- mutate(data_1, ratio = (cor.telson/cor.abdomen))

#telson/abdomen 
#lower ratio = telson and abdomen COR difference smaller
#higher ratio = telson and abdomen COR differece bigger (telson COR bigger)
big_shrimps <- data_1_modified %>%
  group_by(species) %>%
  filter(mass > 15)

small_shrimps <- data_1_modified %>%
  group_by(species) %>%
  filter(mass < 15)

ggplot(small_shrimps,aes(x=mass,y=ratio))+
  geom_point(shape=1)+
  geom_smooth(method=lm)+
  scale_x_continuous(limit=c(min(small_shrimps$mass),max(small_shrimps$mass)))+
  scale_y_continuous(limit=c(min(small_shrimps$ratio),max(small_shrimps$ratio)))+
  labs(x="mass(g)",y="COR Telson to Abdomen Ratio")+
  facet_wrap(~species, scales = "free_x")

ggplot(big_shrimps,aes(x=mass,y=ratio))+
  geom_point(shape=1)+
  geom_smooth(method=lm)+
  scale_x_continuous(limit=c(min(big_shrimps$mass),max(big_shrimps$mass)))+
  scale_y_continuous(limit=c(min(big_shrimps$ratio),max(big_shrimps$ratio)))+
  labs(x="mass(g)",y="COR Telson to Abdomen Ratio")+
  facet_wrap(~species, scales = "free_x")

