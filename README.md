# FPGA Tennis and Squash Simulation

# Project Description
This project is a culmination of our learnings from EC311 Intro to Logic Design. 

This verilog project is a playable 1 (Squash) or 2 (Tennis) player game that can be enjoyed on an FPGA board. The LED light represents the ball's movement which is hit back and forth with increasing speed after each hit. In the tennis game, the first player to reach 3 points wins, while the squash game is continuous, challenging players to achieve the highest score possible.

# Key Files For Functionality
1. debouncer.v - The debouncer is essential to properly manage button inputs so the program does not interpret a single button press as multiple clicks. Also this helps prevent an easy cheat in which the user could hold down the button and guarantee a sucessful hit.
2. clk_divider.v - The clock divider helps the program manage the ball speed and only using one clock the entire game

# File Hierarchy

```

|-- game.v
    |-- tennis.v
    |   |-- debouncer.v
    |   |-- display_score.v
    |   |-- player.v
    |       |-- slow_ball.v
    |           |-- clk_divider.v
    |       |-- ball.v
    |--squash.v
       |-- debouncer.v
       |-- squash_display_score.v
       |-- squash_player.v
           |-- slow_ball.v
               |-- clk_divider.v
               |-- ball.v
       |-- squash_display_score.v


```

