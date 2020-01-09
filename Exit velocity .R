#the main function
#it returns the average exit velocity of the player
exitvelo <- function(dataset) {
  blastdata <- read.csv(dataset, head = TRUE)
  #I calculated the collison efficiency by taking the player's on plane efficiency and
  #dividing by 1000 and adding that to 0.05 (reference the README for reasoning)
  blastdata$ea = .05 + (blastdata$On.Plane.Efficiency.... / 1000) 
  #I used a pitch speed of 85mph (reference the README for reasoning)
  blastdata$ev = (blastdata$ea * 85) + (1+blastdata$ea)*blastdata$Bat.Speed..mph.
  return(avexitvelo = mean(blastdata$ev))
}

#creating a exit velocity for each of the players
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

#combining the exit veolocities into one data frame 
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

#reference README for graphing options
