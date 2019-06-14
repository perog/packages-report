library(ggplot2)
library(gridExtra)

y<-ggplot(iris) +
  geom_point( aes(x=Sepal.Length,
                   y=Sepal.Width,
                   colour=Species,
                   shape=Species))
y
x<-ggplot(iris) + geom_bar(aes(x=Sepal.Length), stat = 'bin')

grid.arrange(x,y)

iris
data("iris")
?data

args(geom_bar)

x1 <- ggplot(iris) + 
  geom_point(aes(x=Sepal.Length,y=Sepal.Width))+
  stat_smooth(aes(x=Sepal.Length,y=Sepal.Width))
x2 <- ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+ 
  geom_point() + stat_smooth()
grid.arrange(x1,x2,nrow=1,ncol=2)

ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()+
  geom_line()+
  geom_smooth()+
  geom_rug()+
  geom_step()+
  geom_text(data=subset(iris,iris$Species=="virginica"),aes(label=Species))



ggplot(iris)+
  geom_point(aes(x=Sepal.Length,
                 y=Sepal.Width,
                 shape=Species,color=Petal.Length)) + scale_color_gradient(name="Pet Len",
                     breaks=c(range(iris$Petal.Length),mean(iris$Petal.Length)),
                     labels=c("Min","Max","Mean"),
                     low="black",high="red")

y + facet_wrap(~Species) + theme_dark()


ggplot(data=iris,mapping=aes(x=Petal.Length, y=Petal.Width))+
  geom_smooth(method="lm") +
  geom_point(aes(color=Species,size=Sepal.Width)) +
  scale_color_manual(values=c("red","blue","green"))


ggplot(data=iris,mapping=aes(x=Petal.Length,y=Petal.Width))+
  geom_point(aes(color=Sepal.Width))+
  geom_smooth(method="lm")


