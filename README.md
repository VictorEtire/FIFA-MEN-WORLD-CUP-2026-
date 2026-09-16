# FIFA Men's World Cup 2026 — Performance Analytics

## Overview

**FIFA Men's World Cup 2026 — Performance Analytics** is a football data analysis project focused on examining player and team performance during the **2026 FIFA Men's World Cup**.

The project combines **SQL data exploration** with **R-based statistical analysis and visualization** to investigate goalscoring, passing, shooting, ball progression, take-ons, crossing, and other in-possession performance metrics.

The analysis is built around player-level in-possession event data and uses the **R tidyverse ecosystem**, particularly `dplyr` and `ggplot2`, alongside SQL queries for broader tournament and venue analysis.

The project demonstrates how football data can be transformed into meaningful performance insights through:

* Data extraction and querying
* Data aggregation and ranking
* Player and team performance analysis
* Statistical relationships and correlation analysis
* Data visualization
* Composite performance scoring
* SQL window functions and conditional logic

---

## Project Objectives

The main objectives of this project are to:

1. Analyse individual player performances during the 2026 FIFA Men's World Cup.
2. Compare teams across key attacking and possession metrics.
3. Identify leading players in goalscoring, passing, shooting, progression, take-ons, and crossing.
4. Examine relationships between different performance indicators.
5. Build a composite player contribution score using multiple performance metrics.
6. Explore tournament history, host countries, venues, capacities, and tournament records using SQL.

---

# Analysis Covered

## 1. Player-Level Performance Analysis

The R analysis examines player performance across several important in-possession metrics.

### Player roster

The project begins by extracting the list of players contained in the dataset.

```r
players %>%
  select(player_name)
```

The underlying analysis uses the `player_in_possession_distributions` dataset as the primary player-level source.

### Top 10 Goalscorers

Players are grouped by name and ranked according to total goals scored.

A horizontal bar chart is used to visualize the top 10 goalscorers.

### Most Attempts at Goal

Players are ranked according to their total attempts at goal, providing an indication of attacking volume and shooting activity.

### Top Ball Progressors

The analysis identifies players who recorded the highest number of ball progressions, highlighting players involved in advancing possession.

### Top Passers

Players are ranked by completed passes to identify the most active passers in the dataset.

### Top Players by Take-Ons

The project examines successful attacking actions involving take-ons to identify players who were most involved in individual ball-carrying or dribbling actions.

### Top Crossers

Crossing activity is examined using attempted and completed crosses, allowing the analysis to compare players involved in delivering the ball from wide areas.

---

# 2. Composite Player Performance Score

The project also introduces a **composite player contribution score**.

Rather than evaluating players using a single statistic, the score combines several dimensions of performance:

* Goals
* Completed passes
* Ball progressions
* Take-ons
* Completed line breaks

The current scoring formula assigns different weights to each metric:

```text
Performance Score =
    Goals × 5
  + Completed Passes × 0.05
  + Ball Progressions × 0.5
  + Take-Ons × 0.5
  + Completed Line Breaks × 0.5
```

This approach provides a multi-dimensional view of player contribution based on the metrics available in the dataset. The weighting system is an analytical choice rather than an official FIFA rating.

---

# 3. Team-Level Performance Analysis

The project aggregates player-level data to compare teams across several performance indicators.

### Goals by Team

Total goals are calculated for each team and displayed using a horizontal bar chart.

### Total Shots by Team

The analysis aggregates attempts at goal to compare attacking shot volume across teams.

### Completed Passes by Team

Total completed passes are calculated for each team, providing a measure of overall passing activity.

### Team Pass Completion Rate

The project calculates each team's pass completion rate using:

```text
Pass Completion Rate =
Completed Passes / Attempted Passes × 100
```

Teams are then ranked according to their calculated completion percentage and visualized using a bar chart.

These team-level analyses are implemented through grouped `dplyr` operations and `ggplot2` visualizations.

---

# 4. Relationship & Correlation Analysis

The project goes beyond rankings by investigating relationships between different performance metrics.

## Pass Attempts vs. Completed Passes

A scatter plot examines the relationship between the number of passes attempted and completed by players.

This helps illustrate whether players with higher passing volume also tend to record higher numbers of completed passes.

## Goals vs. Attempts at Goal

A second scatter plot compares attempts at goal with goals scored.

This provides a simple way to explore the relationship between shooting volume and goalscoring output.

## Correlation Matrix

The project calculates correlations between several player performance metrics, including:

* Attempts at goal
* Ball progressions
* Crosses attempted
* Goals
* Line breaks attempted
* Passes attempted
* Passes completed
* Step-ins
* Switches of play
* Take-ons

The correlation analysis uses complete observations to calculate pairwise relationships between the selected variables.
---

# 5. SQL Analysis

Alongside the R analysis, the project contains a dedicated SQL component covering historical World Cup records, 2026 venues, and player performance.

The SQL dataset covers **Men's and Women's World Cup tournaments from 1930 to 2026**, with the Women's World Cup 2022 excluded from the dataset.

## Tournament Analysis

The SQL queries explore:

* Tournament records
* World Cup winners
* Host countries
* First and most recent tournaments
* Host nations that won their tournaments
* Non-host winners
* Number of times countries hosted the tournament
* Number of titles won by each country
* Tournament classification using `CASE`
* Tournament with the highest number of participating teams
* Changes in team numbers over time
* Ranking of title winners
* Tournament duration
* Longest tournaments

The project also demonstrates SQL concepts including:

* `GROUP BY`
* `HAVING`
* `CASE`
* Subqueries
* `COUNT()`
* `SUM()`
* `MAX()`
* `AVG()`
* `DATEDIFF()`
* `STR_TO_DATE()`
* `LAG()`
* `RANK()`
* Window functions

For example, the tournament analysis uses `LAG()` to compare the number of participating teams with the previous tournament.

---

# 6. FIFA Men's World Cup 2026 Venue Analysis

The SQL component also examines the venues associated with the 2026 FIFA Men's World Cup.

The venue analysis includes:

* Stadium names
* Cities
* Host countries
* Stadium capacity
* Elevation
* Number of venues per country
* Total venue capacity
* Capacity share by host country
* Venues above 50,000 capacity
* Top 10 venues by capacity
* Venues above the average capacity
* Venue capacity classification
* Venue elevation classification

The project uses SQL `CASE` statements to categorize venues by both capacity and elevation.

It also calculates each venue's percentage contribution to the combined capacity of the venues in the dataset using a SQL window function.

---

# Dataset

The main player-performance dataset used by the R analysis is:

```text
player_in_possession_distributions.csv
```

The dataset contains player-level in-possession performance variables used throughout the analysis, including metrics such as:

```text
player_name
team
goals
attempts_at_goal
passes_attempted
passes_completed
ball_progressions
take_ons
crosses_attempted
crosses_completed
line_breaks_attempted
line_breaks_completed
step_ins
switches_of_play
```

The SQL project also works with tournament and venue tables, including:

```text
tournaments
venues
player_in_possession_distributions
```

---

# Technology Stack

### R

* R
* tidyverse
* dplyr
* ggplot2

### SQL

The SQL queries use features associated with **MySQL**, including functions such as `DATEDIFF()`, `STR_TO_DATE()`, window functions, conditional expressions, aggregation, and subqueries.

---

# Project Structure

A suggested repository structure is:

```text
FIFA-Mens-World-Cup-2026-Analytics/
│
├── README.md
├── FIFA MEN WORLD CUP 2026.R
├── WORLD CUP.sql
├── player_in_possession_distributions.csv
│
└── visualizations/
    ├── top_goalscorers.png
    ├── team_goals.png
    ├── team_shots.png
    ├── pass_completion.png
    ├── pass_attempts_vs_completed.png
    └── goals_vs_attempts.png
```

---

# Getting Started

## 1. Install R packages

Install the required packages:

```r
install.packages(c(
  "tidyverse",
  "dplyr",
  "ggplot2"
))
```

## 2. Load the libraries

```r
library(tidyverse)
library(dplyr)
library(ggplot2)
```

## 3. Load the player dataset

Make sure the CSV file is located in your working directory.

```r
players <- read.csv(
  "player_in_possession_distributions.csv"
)
```

## 4. Run the analysis

Open:

```text
FIFA MEN WORLD CUP 2026.R
```

and execute the analysis sections individually or run the complete script.

For the SQL component, open:

```text
WORLD CUP.sql
```

and execute the queries in a MySQL-compatible environment.

---

# Key Analytical Questions

This project is designed to answer questions such as:

### Player Performance

* Who scored the most goals?
* Which players attempted the most shots?
* Who completed the most passes?
* Which players progressed the ball most frequently?
* Which players recorded the most take-ons?
* Who attempted and completed the most crosses?
* Which players recorded the highest composite contribution scores?

### Team Performance

* Which teams scored the most goals?
* Which teams generated the most shots?
* Which teams completed the most passes?
* Which teams had the highest pass completion rates?

### Statistical Relationships

* How strongly are attempted passes related to completed passes?
* Is shooting volume associated with goals scored?
* How are different in-possession metrics related to one another?

### Tournament & Venue Analysis

* Which countries have hosted the World Cup most frequently?
* Which countries have won the most titles?
* How has the number of participating teams changed over time?
* Which 2026 venues have the largest capacities?
* How is total venue capacity distributed across the host countries?

---

# Data Quality & Known Issues

The current scripts contain several areas that should be reviewed before treating the outputs as final.

### 1. Ball progression ranking

The ball-progression analysis sorts players in descending order but subsequently uses `slice_tail()`. This can select the lower end of the sorted dataset rather than the intended leaders.

A clearer approach is:

```r
arrange(desc(progressions)) %>%
slice_head(n = 10)
```

The current implementation appears in the R script at the ball-progression section.

### 2. Take-ons variable name

The take-ons section currently references:

```r
players-data
```

instead of:

```r
players_data
```

In R, the hyphen is interpreted as the subtraction operator, so the variable should be corrected before running this section.

### 3. Crossers analysis

The current crossers calculation summarizes the entire dataset rather than grouping the results by player. Consequently, it should be revised if the intended output is a **Top 10 Crossers** ranking.

A player-level version would use:

```r
top_crossers <- players_data %>%
  group_by(player_name) %>%
  summarise(
    crosses_attempted = sum(crosses_attempted, na.rm = TRUE),
    crosses_completed = sum(crosses_completed, na.rm = TRUE)
  ) %>%
  arrange(desc(crosses_attempted)) %>%
  slice_head(n = 10)
```

### 4. Missing-value handling

Some sections explicitly use `na.rm = TRUE`, while other aggregations do not. For consistency, missing-value handling should be standardized across the analysis.

### 5. Composite score

The composite performance score uses manually selected weights. These weights are useful for exploratory analysis but should not be interpreted as an official measure of player quality.

---

# What This Project Demonstrates

This project demonstrates practical skills in:

* Football analytics
* Exploratory data analysis
* Data cleaning and aggregation
* SQL querying
* R programming
* `dplyr` data manipulation
* `ggplot2` visualization
* Statistical correlation
* Performance metric design
* Window functions
* Ranking and segmentation
* Translating raw event data into football insights

---

# Future Improvements

Potential extensions to the project include:

* Add player position analysis
* Calculate per-90-minute statistics
* Compare attacking, midfield, and defensive players separately
* Add assists and key passes where available
* Create team possession profiles
* Analyse performance by match stage
* Add expected goals (xG) if available
* Add expected assists (xA) if available
* Build interactive dashboards in **Power BI** or **Tableau**
* Create player comparison radar charts
* Develop an interactive team ranking dashboard
* Standardize the composite score using normalized metrics
* Add statistical significance testing to selected relationships
* Automate the data pipeline from SQL to R

---

# Disclaimer

This project is an **independent data-analysis exercise** based on the datasets included in the repository.

The composite performance score is an analytical framework created for this project and should not be interpreted as an official FIFA player rating.

All conclusions should be understood within the scope, structure, and limitations of the available dataset.
