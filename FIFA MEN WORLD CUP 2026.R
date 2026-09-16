library(tidyverse)
players <- read.csv("player_in_possession_distributions.csv")


ALL PLAYERS IN FIFA MEN WORLD CUP 2026

players %>%
  select(player_name)



TOP 10 GOALSCORERS DURING FIFA MEN WORLD CUP 2026
players_data <-
read.csv("player_in_possession_distributions.csv")

library(dplyr)
library(ggplot2)

top_players <- players_data %>%
  group_by(player_name) %>%
  summarise(total_goals = sum(goals, 
na.rm = TRUE)) %>%
  arrange(desc(total_goals)) %>%
  slice_head(n = 10)

ggplot(
  top_players,
  aes(
    x = reorder(player_name,
  total_goals),
  y= total_goals 
  )
) + 
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 Goalscorers- Men's World Cup 2026",
    x = "Player",
    y = "Goals"
  )



10 PLAYERS WITH THE MOST ATTEMPT AT GOAL-FIFA MEN WORLD CUP 2026

library(dplyr)
library(ggplot2)

players_data <- read.csv("player_in_possession_distributions.csv")

top_attempts <- players_data %>%
  group_by(player_name) %>%
  summarise(
    total_attempts = sum(attempts_at_goal, na.rm = TRUE)
  ) %>%
  arrange(total_attempts) %>%
  slice_tail(n = 10)

top_attempts



TOP PLAYERS BY BALL PROGRESSIONS-FIFA MEN WORLD CUP 2026

top_progressors <- players_data %>%
  group_by(player_name) %>%
  summarise(
    progressions =
  sum(ball_progressions, na.rm =  TRUE)
  ) %>%
  arrange(desc(progressions)) %>%
  slice_tail(n = 10)



TOP PASSERS-FIFA MEN WORLD CUP 2026
top_passers <- players_data %>%
  group_by(player_name) %>%
  summarise(
    completed_passes =
      sum(passes_completed, na.rm = TRUE)
  ) %>%
  arrange(desc(completed_passes)) %>%
  slice_head(n =10)



TOP PLAYERS BY TAKE-ONS -FIFA MEN WORLD CUP 2026
top_takeons <- players-data %>%
  group_by(player_name) %>%
  summarise(
    take_ons = sum(take_ons, na.rm = 
  TRUE)
  ) %>%
  arrange(desc(take_ons)) %>%
  slice_head(n=10)


  
TOP CROSSERS-FIFA MEN WORLD CUP 2026
top_crossers <- players_data %>%
  summarise(
    crosses = sum(crosses_attempted,
  na.rm = TRUE),
  completed =
sum(crosses_completed, na.rm = TRUE)
  ) %>%
  arrange(desc(crosses)) %>%
  slice_head(n = 10)



NUMBER OF GOALS BY TEAMS-FIFA MEN WORLD CUP 2026 

library(dplyr)
library(ggplot2)

team_goals <- players_data %>%
  group_by(team) %>%
  summarise(
    total_goals = sum(goals, na.rm = TRUE)
  ) %>%
  arrange(desc(total_goals))

team_goals

ggplot(
  team_goals,
  aes(
    x = reorder(team, total_goals),
    y = total_goals
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Goals by Team",
    x = "Team",
    y = "Total Goals"
  )




TOTAL SHOTS BY TEAM-FIFA MEN WORLD CUP 2026 

library(dplyr)
library(ggplot2)

team_shots <- players_data %>%
  group_by(team) %>%
  summarise(
    total_shots = sum(attempts_at_goal, na.rm = TRUE)
  ) %>%
  arrange(desc(total_shots))

team_shots

ggplot(
  team_shots,
  aes(
    x = reorder(team, total_shots),
    y = total_shots
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Total Shots by Teams",
    x = "Team",
    y = "Total Shots"
  )




TEAMS THAT COMPLETED THE MOST PASSES-FIFA MEN WORLD CUP 2026 
team_passing <- players_data %>%
  group_by(team) %>%
  summarise(
    passes_attempted = sum(passes_attempted),
    passes_completed = sum(passes_completed)
  ) %>%
  arrange(desc(passes_completed))




TEAM PASS COMPLETION RATE-FIFA MEN WORLD CUP 2026 
team_passing <- players_data %>%
  group_by(team) %>%
  summarise(
    attempted = sum(passes_attempted),
    completed = sum(passes_completed)
  ) %>%
  mutate(
    pass_completion = completed / attempted * 100
  ) %>%
  arrange(desc(pass_completion))

ggplot(
  team_passing,
  aes(
    x = reorder(team, 
  pass_completion),
   y = pass_completion
  )
) + 
  geom_col() +
  coord_flip() +
  labs(
    title = "Pass Completion Rate by Team",
    x = "Team",
    y = "Pass Completion (%)"
  )




PASS COMPLETION VS PASS ATTEMPTED-FIFA MEN WORLD CUP 2026  

passing_analysis <- players_data %>%
  group_by(player_name) %>%
  summarise(
    passes_attempted =
  sum(passes_attempted),
      passes_completed =
  sum(passes_completed)
  )%>%
  arrange(desc(passes_completed))

ggplot(
  passing_analysis,
  aes(
    x = passes_attempted,
    y = passes_completed
  )
) +
  geom_point() +
  labs(
    title = "Pass Attempts vs Completed Passes",
    x = "Passes Attempted",
    y = "Passes Completed"
  )



GOALS VS SHOTS ATTEMPTS-FIFA MEN WORLD CUP 2026  
goal_analysis <- players_data %>%
  group_by(player_name) %>%
  summarise(
    goals = sum(goals),
    attempts = sum(attempts_at_goal)
  )

ggplot(
  goal_analysis,
  aes(
    x = attempts,
    y = goals
  )
) +
  geom_point() +
  labs(
    title = "Goals vs Attempts at Goal",
    x = "Attempts at Goal",
    y = "Goals"
  )



PLAYERS WITH MOST CONTRIBUTIONS-FIFA MEN WORLD CUP 2026  

player_score <- players_data %>%
  group_by(player_name) %>%
  summarise(
    goals = sum(goals),
    passes = sum(passes_completed),
    progressions = sum(ball_progressions),
    take_ons = sum(take_ons),
    line_breaks = sum(line_breaks_completed)
  ) %>%
  mutate(
    performance_score =
      goals * 5 +
      passes * 0.05 +
      progressions * 0.5 +
      take_ons * 0.5 +
      line_breaks * 0.5
  ) %>%
  arrange(desc(performance_score))




CORRELATION ANALYSIS-FIFA MEN WORLD CUP 2026  
players_data %>%
  select(
    attempts_at_goal,
    ball_progressions,
    crosses_attempted,
    goals,
    line_breaks_attempted,
    passes_attempted,
    passes_completed,
    step_ins,
    switches_of_play,
    take_ons
  ) %>%
  cor(use = "complete.obs")
