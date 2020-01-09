setwd("/Users/benmangelsdorf/Desktop/Baseball Projects/Data")
blast <- read.csv("armstrong.csv", head = TRUE)
ea = .1 + (blast$On.Plane.Efficiency.... / 1000) 
ev = (ea * 55) + (1+ea)*blast$Bat.Speed..mph.
blast$ea = .1 + (blast$On.Plane.Efficiency.... / 1000) 
blast$ev = (blast$ea * 55) + (1+blast$ea)*blast$Bat.Speed..mph.
blast$ea2 = .05 + (blast$On.Plane.Efficiency.... / 1000) 
blast$ev2 = (blast$ea2 * 55) + (1+blast$ea2)*blast$Bat.Speed..mph.
blast$ea3 =  blast$On.Plane.Efficiency.... / 1000
blast$ev3 = (blast$ea3 * 55) + (1+blast$ea3)*blast$Bat.Speed..mph.
mean(blast$ev)

#final:

setwd("/Users/benmangelsdorf/Desktop/Baseball Projects/Data")
exitvelo <- function(dataset) {
  blastdata <- read.csv(dataset, head = TRUE)
  blastdata$ea = .05 + (blastdata$On.Plane.Efficiency.... / 1000) 
  blastdata$ev = (blastdata$ea * 85) + (1+blastdata$ea)*blastdata$Bat.Speed..mph.
  return(avexitvelo = mean(blastdata$ev))
}
armstrongev <- exitvelo("armstrong.csv")
ashworthev <- exitvelo("ashworth.csv")
beesleyev <- exitvelo("beesley.csv")
cabreraev <- exitvelo("cabrera.csv")
canoev <- exitvelo("cano.csv")
corioev <- exitvelo("corio.csv")
dicarloev <- exitvelo("dicarlo.csv")
emmersonev <- exitvelo("emmerson.csv")
greeneev <- exitvelo("greene.csv")
gurnikev <- exitvelo("gurnik.csv")
kuzmaev <- exitvelo("kuzma.csv")
leeev <- exitvelo("lee.csv")
loucksev <- exitvelo("loucks.csv")
marinconzev <- exitvelo("marinconz.csv")
ogrinev <- exitvelo("ogrin.csv")
samuelsonev <- exitvelo("samuelson.csv")
sandsev <- exitvelo("sands.csv")
taylorev <- exitvelo("taylor.csv")
wagensellerev <- exitvelo("wagenseller.csv")
wellsev <- exitvelo("wells.csv")
teamev <- data.frame(matrix(ncol = 0, nrow = 20))
teamev$ExitVelocity <- c(armstrongev, ashworthev, beesleyev, cabreraev, canoev, corioev,
                        dicarloev, emmersonev, greeneev, gurnikev, kuzmaev, leeev,
                        loucksev,marinconzev, ogrinev, samuelsonev, sandsev, taylorev,
                        wagensellerev, wellsev)
teamev$Player <- c("armstrong", "ashworth", "beesley", "cabrera", "cano", "corio",
                   "dicarlo", "emmerson", "greene", "gurnik", "kuzma", "lee",
                   "loucks", "marinconz", "ogrin", "samuelson", "sands", "taylor",
                   "wagenseller", "wells")
attach(teamev)
teamev <- teamev[order(ExitVelocity),]
library(ggplot2)
#final graph with names: 
graph <- ggplot(teamev, aes(x=reorder(Player, ExitVelocity), y=ExitVelocity, 
                            label=Player), width=.5) + 
  geom_bar(stat="identity", color="gold3", fill="darkgreen") + 
  geom_text(aes(label=Player), vjust=-.5, size=3) + 
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank()) + 
  ggtitle("Exit Velocities") + xlab("Player") + ylab("Exit Velocity (mph)")
graph + coord_cartesian(ylim=c(80,100), xlim=c(.5,20.5))

#final graph without names: 
graph <- ggplot(teamev, aes(x=reorder(Player, ExitVelocity), y=ExitVelocity, 
                            label=Player), width=.5) + 
  geom_bar(stat="identity", color="gold3", fill="darkgreen") + 
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank()) + 
  ggtitle("Exit Velocities") + xlab("Player") + ylab("Exit Velocity (mph)")
graph + coord_cartesian(ylim=c(80,100))


# testing to see if on plane efficiency changes the order of players
swingspeed <- function(dataset) {
  blastdata <- read.csv(dataset, head = TRUE)
  return(avss = mean(blastdata$Bat.Speed..mph.))
}
armstrongss <- swingspeed("armstrong.csv")
ashworthss <- swingspeed("ashworth.csv")
beesleyss <- swingspeed("beesley.csv")
cabrerass <- swingspeed("cabrera.csv")
canoss <- swingspeed("cano.csv")
corioss <- swingspeed("corio.csv")
dicarloss <- swingspeed("dicarlo.csv")
emmersonss <- swingspeed("emmerson.csv")
greeness <- swingspeed("greene.csv")
gurnikss <- swingspeed("gurnik.csv")
kuzmass <- swingspeed("kuzma.csv")
leess <- swingspeed("lee.csv")
loucksss <- swingspeed("loucks.csv")
marinconzss <- swingspeed("marinconz.csv")
ogrinss <- swingspeed("ogrin.csv")
samuelsonss <- swingspeed("samuelson.csv")
sandsss <- swingspeed("sands.csv")
taylorss <- swingspeed("taylor.csv")
wagensellerss <- swingspeed("wagenseller.csv")
wellsss <- swingspeed("wells.csv")
teamss <- data.frame(matrix(ncol = 0, nrow = 20))
teamss$SwingSpeed <- c(armstrongss, ashworthss, beesleyss, cabrerass, canoss, corioss,
                         dicarloss, emmersonss, greeness, gurnikss, kuzmass, leess,
                         loucksss,marinconzss, ogrinss, samuelsonss, sandsss, taylorss,
                         wagensellerss, wellsss)
teamss$Player <- c("armstrong", "ashworth", "beesley", "cabrera", "cano", "corio",
                   "dicarlo", "emmerson", "greene", "gurnik", "kuzma", "lee",
                   "loucks", "marinconz", "ogrin", "samuelson", "sands", "taylor",
                   "wagenseller", "wells")
