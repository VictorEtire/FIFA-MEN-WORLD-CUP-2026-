FIFA Men's World Cup 2026 — Performance Analytics

A data analysis project exploring player and team performance during the 2026 FIFA Men's World Cup, using in-possession event data (player_in_possession_distributions.csv) and the R tidyverse / dplyr / ggplot2 stack.

What's in this repo:
-Player-level analysis
-Full player roster listing
-Top 10 goalscorers (bar chart)
-Players with the most shot attempts at goal
-Top ball progressors
-Top passers by completed passes
-Top players by successful take-ons
-Top crossers (attempted vs. completed)

Composite "player contribution" score combining goals, passing, progressions, take-ons, and line breaks
-Team-level analysis
-Goals scored by team (bar chart)
-Total shots by team (bar chart)
-Teams ranked by completed passes
-Team pass completion rate (%) (bar chart)

Relationship / correlation analysis
-Pass attempts vs. passes completed (scatter plot)
-Goals vs. shot attempts (scatter plot)
-Correlation matrix across key performance metrics (attempts at goal, ball progressions, crosses, goals, line breaks, passes, step-ins, switches of play, take-ons)



Tech stack
R with tidyverse, dplyr, ggplot2
Data
player_in_possession_distributions.csv — per-player in-possession event data used throughout the analysis
Getting started

r
install.packages(c("tidyverse", "dplyr", "ggplot2"))
library(tidyverse)

players_data <- read.csv("player_in_possession_distributions.csv")

Then run any of the analysis blocks in analysis.R to reproduce the summaries and charts described above.

Notes / known issues
The "top attempts at goal" and "top ball progressions" sections currently use slice_tail() after sorting, which returns the bottom performers rather than the top. Use slice_head() if you want the leaders.
Column names must exactly match the source CSV (e.g. players_data, not players-data) — R treats hyphens as the subtraction operator, not a valid identifier character.
