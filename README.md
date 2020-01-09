# Exit-Velocity-from-Blast
calculating exit velocity from blast metrics

The metrics used were swing speed and on plane efficiency

The exit velocities were calculated using an equation derived by Alan Nathan in his paper "Characterizing the performance of baseball bats" which can be found here: http://baseball.physics.illinois.edu/AJP-Feb2003.pdf
    The equation: exit velocity = ea(velocity of the ball) + (1 + ea)(velocity of the bat) 
ea is the collision efficiency which is related to the ball exit speed ratio (BESR). BESR was used to quantify bat performance before BBCOR was used 

To calculate the ea for each player, I took their on plane percentage and divided it by 1000 and added it to 0.05 resulting in a range of ea's from 0.05 to 0.15. In my research about collision efficiency I found that if a player barrels the ball, their collision efficiency is between 0.1 and 0.2 depending on the bat. Therefore, I took the average of these two estimates and decided that I would use 0.15 as the ea if the player barreled the ball. On plane percentage tends to be a good indicator of barreling the ball which is why I used that to determine what each ea would be. A swing with 100% on plane percentage have the best chance of barreling the ball so they would recieve the highest ea. 

R packages used:
    ggplot2

    
