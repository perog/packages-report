#' --- 
#'  title: "ggplot2 exercises"
#'  author: "Per Oksvold"
#'  date: "`r format(Sys.Date(),format='%Y-%m-%d')`"
#'  output: github_document
#' ---

library(ggplot2)
library(gridExtra)
library(ggrepel)
library(tidyverse)

#' Challange 1
ec <- read.csv("data/data_economist.csv",header=T)

ec$Region <- factor(ec$Region,levels = c("EU W. Europe",
                                         "Americas",
                                         "Asia Pacific",
                                         "East EU Cemt Asia",
                                         "MENA",
                                         "SSA"),
                    labels = c("OECD",
                               "Americas",
                               "Asia &\nOceania",
                               "Central &\nEastern Europe",
                               "Middle East &\nNorth Africa",
                               "Sub-Saharan\nAfrica"))

labels <- c("Congo","Afghanistan","Sudan","Myanmar","Iraq","Venezuela","Russia","Argentina","Brazil","Italy","South Africa","Cape Verde","Bhutan","Botswana","Britian","New Zealand","Greece","China","India","Rwanda","Spain","France","United States","Japan","Norway","Singapore","Barbados","Germany")

ggplot(ec,aes(x=CPI,y=HDI,color=Region))+
  geom_smooth(aes(fill="red"), method="lm",formula=y~poly(x,2),se=F,size=0.6,color="red") +
  geom_point(shape=21,size=3,stroke=0.8,fill="white") +
  geom_text_repel(data=subset(ec,Country %in% labels),aes(label=Country),color="black", box.padding=unit(1,'lines'),segment.size=0.25, size=3) +
  scale_x_continuous(name="Corruption Perceptions Index, 2011 (10=least corrupt)",
                     breaks=1:10,limits=c(1,10))+
  scale_y_continuous(name="Human Development Index, 2011 (1=best)",
                     breaks=seq(from=0,to=1,by=0.1),limits=c(0.2,1)) +
  scale_fill_manual(name="trend",values="red",labels=expression(paste(R^2,"=52%"))) +
  scale_color_manual(values=c("#23576E","#099FDB","#29B00E", "#208F84","#F55840","#924F3E")) +
  labs(title="Corruption and human development",
       caption="Sources: Transparency International; UN Human Development Report") +
  guides(color=guide_legend(nrow=1)) +
  theme_bw() +
  theme(legend.position="top",
        panel.grid.minor=element_blank(),
             panel.grid.major.x=element_blank(),
             panel.background=element_blank(),
             panel.border=element_blank(),
             legend.title=element_blank(),
             axis.title=element_text(face="italic"),
             axis.ticks.y=element_blank(),
             axis.ticks.x=element_line(color="grey60"),
             plot.title=element_text(face="bold"),
             plot.caption=element_text(hjust=0,size=8))


#' Challange 2
 
sum_w_na <- function(x) ifelse(all(is.na(x)),NA,sum(x,na.rm=TRUE))
cols <- c("#e7f0fa","#c9e2f6","#95cbee","#0099dc","#4ab04a", "#ffd73e","#eec73a","#e29421","#f05336","#ce472e")

mes <- read.csv("data/data_wsj.csv", skip=2, header=T, stringsAsFactors=F, dec='.')
head(mes)
str(mes)
mest <- as_tibble(mes)

mest_l <- gather(mest, key=state, value=value, -YEAR, -WEEK)
colnames(mest_l) <- tolower(colnames(mest_l))

mest_f <- mest_l %>% 
  mutate(state = if(length(state)>6) paste0(str_to_title(substr(state, 0, 5)),'.') else str_to_title(state)) %>% 
  mutate(value=str_replace(value,"-",NA_character_), value = as.numeric(value)) %>% 
  group_by(year, state) %>% 
  summarize(total = sum_w_na(value))

ggplot(mest_f,aes(x=year,y=reorder(state, desc(state)),fill=total)) +
  geom_tile(color="white",size=0.25) +
  #annotate("text", x=1963, y=51, label="Vaccine introduced")+
  annotate("text",label="Vaccine introduced",x=1963,y=53, 
           vjust=1,hjust=0,size=I(2))+
  annotate("segment", x=1963, xend=1963, y=0.5, yend=49.5) +
  scale_y_discrete(expand=c(0,0))+
  scale_x_continuous(breaks=seq(1930,2010,by=10),
                   expand=c(0,0))+
  scale_fill_gradientn(colors=cols,
                       na.value="grey95",
                       limits=c(0,4000),
                       values=c(0,0.01,0.02,0.03,0.09,0.1,0.15,0.25,0.4,0.5,1),
                       labels=c("0k","1k","2k","3k","4k"),
                       guide=guide_colourbar(ticks=T,nbin=50,
                                             barheight=.5,label=T, 
                                             barwidth=10))+
  labs(x="",y="",fill="",title="Measels") +
  coord_fixed() +
  theme_minimal() +
  theme(legend.position="bottom",
        legend.title=element_blank(),
        legend.text=element_text(color="grey20"),
        plot.title=element_text(face="bold", hjust = 0),
        panel.background=element_rect(color="white"),
        panel.grid=element_blank())

#                     breaks=seq(from=0,to=1,by=0.1),limits=c(0.2,1)) 
  

col.names = c("Year", "week", "")
levels(df$names) <- tolower(levels(df$names))


