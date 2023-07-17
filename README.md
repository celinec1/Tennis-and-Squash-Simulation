# FPGA Tennis and Squash Simulation

# Project Description
This project is a culmination of our learnings from EC311 Intro to Logic Design.

The tennis and squash simulation is a playable 1 or 2 player game that can be played on an FPGA board. The LED light represents the movement of a ball moving where with every hit, the ball speed increases. The tennis game is won by the first player to reach 3 points and the squash game is a continuous game which you try to reach the highest score possible.

# Key Files For Functionality
1. debouncer.v - The debouncer is essential to properly manage button inputs so the program does not interpret a single button press as multiple clicks. Also this helps prevent an easy cheat in which the user could hold down the button and guarantee a sucessful hit.
2. clk_divider.v - The clock divider helps the program manage the ball speed and only using one clock the entire game

# File Hierarchy

```

|-- game.v
    |-- tennis.v
       |-- debouncer.v
       |-- player.v
           |-- slow_ball.v
               |-- clk_divider.v
               |-- ball.v
       |-- display_score.v
    |--squash.v
       |-- debouncer.v
       |-- squash_player.v
           |-- slow_ball.v
               |-- clk_divider.v
               |-- ball.v
       |-- squash_display_score.v


```

