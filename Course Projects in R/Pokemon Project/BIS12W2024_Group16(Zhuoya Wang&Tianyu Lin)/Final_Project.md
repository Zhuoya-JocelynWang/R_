---
title: "BIS15L_Final"
author: "Tianyu Lin & Zhuoya Wang"
date: "2024-03-07"
output: 
  html_document: 
    keep_md: true
---


```r
library("tidyverse")
library("janitor")
library("naniar")
library("dplyr")
```


```r
pokemon <- read_csv("pokemon.csv")
```

```
## Rows: 801 Columns: 41
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (7): abilities, capture_rate, classfication, japanese_name, name, type1...
## dbl (34): against_bug, against_dark, against_dragon, against_electric, again...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```


```r
glimpse(pokemon)
```

```
## Rows: 801
## Columns: 41
## $ abilities         <chr> "['Overgrow', 'Chlorophyll']", "['Overgrow', 'Chloro…
## $ against_bug       <dbl> 1.00, 1.00, 1.00, 0.50, 0.50, 0.25, 1.00, 1.00, 1.00…
## $ against_dark      <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
## $ against_dragon    <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
## $ against_electric  <dbl> 0.5, 0.5, 0.5, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0, 1.0, 1.…
## $ against_fairy     <dbl> 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.0, 1.0, 1.0, 1.0, 1.…
## $ against_fight     <dbl> 0.50, 0.50, 0.50, 1.00, 1.00, 0.50, 1.00, 1.00, 1.00…
## $ against_fire      <dbl> 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2.0, 2.…
## $ against_flying    <dbl> 2.0, 2.0, 2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.…
## $ against_ghost     <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0…
## $ against_grass     <dbl> 0.25, 0.25, 0.25, 0.50, 0.50, 0.25, 2.00, 2.00, 2.00…
## $ against_ground    <dbl> 1.0, 1.0, 1.0, 2.0, 2.0, 0.0, 1.0, 1.0, 1.0, 0.5, 0.…
## $ against_ice       <dbl> 2.0, 2.0, 2.0, 0.5, 0.5, 1.0, 0.5, 0.5, 0.5, 1.0, 1.…
## $ against_normal    <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
## $ against_poison    <dbl> 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.…
## $ against_psychic   <dbl> 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1…
## $ against_rock      <dbl> 1, 1, 1, 2, 2, 4, 1, 1, 1, 2, 2, 4, 2, 2, 2, 2, 2, 2…
## $ against_steel     <dbl> 1.0, 1.0, 1.0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.0, 1.…
## $ against_water     <dbl> 0.5, 0.5, 0.5, 2.0, 2.0, 2.0, 0.5, 0.5, 0.5, 1.0, 1.…
## $ attack            <dbl> 49, 62, 100, 52, 64, 104, 48, 63, 103, 30, 20, 45, 3…
## $ base_egg_steps    <dbl> 5120, 5120, 5120, 5120, 5120, 5120, 5120, 5120, 5120…
## $ base_happiness    <dbl> 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, …
## $ base_total        <dbl> 318, 405, 625, 309, 405, 634, 314, 405, 630, 195, 20…
## $ capture_rate      <chr> "45", "45", "45", "45", "45", "45", "45", "45", "45"…
## $ classfication     <chr> "Seed Pokémon", "Seed Pokémon", "Seed Pokémon", "Liz…
## $ defense           <dbl> 49, 63, 123, 43, 58, 78, 65, 80, 120, 35, 55, 50, 30…
## $ experience_growth <dbl> 1059860, 1059860, 1059860, 1059860, 1059860, 1059860…
## $ height_m          <dbl> 0.7, 1.0, 2.0, 0.6, 1.1, 1.7, 0.5, 1.0, 1.6, 0.3, 0.…
## $ hp                <dbl> 45, 60, 80, 39, 58, 78, 44, 59, 79, 45, 50, 60, 40, …
## $ japanese_name     <chr> "Fushigidaneフシギダネ", "Fushigisouフシギソウ", "Fu…
## $ name              <chr> "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "C…
## $ percentage_male   <dbl> 88.1, 88.1, 88.1, 88.1, 88.1, 88.1, 88.1, 88.1, 88.1…
## $ pokedex_number    <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1…
## $ sp_attack         <dbl> 65, 80, 122, 60, 80, 159, 50, 65, 135, 20, 25, 90, 2…
## $ sp_defense        <dbl> 65, 80, 120, 50, 65, 115, 64, 80, 115, 20, 25, 80, 2…
## $ speed             <dbl> 45, 60, 80, 65, 80, 100, 43, 58, 78, 45, 30, 70, 50,…
## $ type1             <chr> "grass", "grass", "grass", "fire", "fire", "fire", "…
## $ type2             <chr> "poison", "poison", "poison", NA, NA, "flying", NA, …
## $ weight_kg         <dbl> 6.9, 13.0, 100.0, 8.5, 19.0, 90.5, 9.0, 22.5, 85.5, …
## $ generation        <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
## $ is_legendary      <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
```


```r
summary(pokemon)
```

```
##   abilities          against_bug      against_dark   against_dragon  
##  Length:801         Min.   :0.2500   Min.   :0.250   Min.   :0.0000  
##  Class :character   1st Qu.:0.5000   1st Qu.:1.000   1st Qu.:1.0000  
##  Mode  :character   Median :1.0000   Median :1.000   Median :1.0000  
##                     Mean   :0.9963   Mean   :1.057   Mean   :0.9688  
##                     3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000  
##                     Max.   :4.0000   Max.   :4.000   Max.   :2.0000  
##                                                                      
##  against_electric against_fairy   against_fight    against_fire  
##  Min.   :0.000    Min.   :0.250   Min.   :0.000   Min.   :0.250  
##  1st Qu.:0.500    1st Qu.:1.000   1st Qu.:0.500   1st Qu.:0.500  
##  Median :1.000    Median :1.000   Median :1.000   Median :1.000  
##  Mean   :1.074    Mean   :1.069   Mean   :1.066   Mean   :1.135  
##  3rd Qu.:1.000    3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:2.000  
##  Max.   :4.000    Max.   :4.000   Max.   :4.000   Max.   :4.000  
##                                                                  
##  against_flying  against_ghost   against_grass   against_ground 
##  Min.   :0.250   Min.   :0.000   Min.   :0.250   Min.   :0.000  
##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:0.500   1st Qu.:1.000  
##  Median :1.000   Median :1.000   Median :1.000   Median :1.000  
##  Mean   :1.193   Mean   :0.985   Mean   :1.034   Mean   :1.098  
##  3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:1.000   3rd Qu.:1.000  
##  Max.   :4.000   Max.   :4.000   Max.   :4.000   Max.   :4.000  
##                                                                 
##   against_ice    against_normal  against_poison   against_psychic
##  Min.   :0.250   Min.   :0.000   Min.   :0.0000   Min.   :0.000  
##  1st Qu.:0.500   1st Qu.:1.000   1st Qu.:0.5000   1st Qu.:1.000  
##  Median :1.000   Median :1.000   Median :1.0000   Median :1.000  
##  Mean   :1.208   Mean   :0.887   Mean   :0.9753   Mean   :1.005  
##  3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:1.0000   3rd Qu.:1.000  
##  Max.   :4.000   Max.   :1.000   Max.   :4.0000   Max.   :4.000  
##                                                                  
##   against_rock  against_steel    against_water       attack      
##  Min.   :0.25   Min.   :0.2500   Min.   :0.250   Min.   :  5.00  
##  1st Qu.:1.00   1st Qu.:0.5000   1st Qu.:0.500   1st Qu.: 55.00  
##  Median :1.00   Median :1.0000   Median :1.000   Median : 75.00  
##  Mean   :1.25   Mean   :0.9835   Mean   :1.058   Mean   : 77.86  
##  3rd Qu.:2.00   3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:100.00  
##  Max.   :4.00   Max.   :4.0000   Max.   :4.000   Max.   :185.00  
##                                                                  
##  base_egg_steps  base_happiness     base_total    capture_rate      
##  Min.   : 1280   Min.   :  0.00   Min.   :180.0   Length:801        
##  1st Qu.: 5120   1st Qu.: 70.00   1st Qu.:320.0   Class :character  
##  Median : 5120   Median : 70.00   Median :435.0   Mode  :character  
##  Mean   : 7191   Mean   : 65.36   Mean   :428.4                     
##  3rd Qu.: 6400   3rd Qu.: 70.00   3rd Qu.:505.0                     
##  Max.   :30720   Max.   :140.00   Max.   :780.0                     
##                                                                     
##  classfication         defense       experience_growth    height_m     
##  Length:801         Min.   :  5.00   Min.   : 600000   Min.   : 0.100  
##  Class :character   1st Qu.: 50.00   1st Qu.:1000000   1st Qu.: 0.600  
##  Mode  :character   Median : 70.00   Median :1000000   Median : 1.000  
##                     Mean   : 73.01   Mean   :1054996   Mean   : 1.164  
##                     3rd Qu.: 90.00   3rd Qu.:1059860   3rd Qu.: 1.500  
##                     Max.   :230.00   Max.   :1640000   Max.   :14.500  
##                                                        NA's   :20      
##        hp         japanese_name          name           percentage_male 
##  Min.   :  1.00   Length:801         Length:801         Min.   :  0.00  
##  1st Qu.: 50.00   Class :character   Class :character   1st Qu.: 50.00  
##  Median : 65.00   Mode  :character   Mode  :character   Median : 50.00  
##  Mean   : 68.96                                         Mean   : 55.16  
##  3rd Qu.: 80.00                                         3rd Qu.: 50.00  
##  Max.   :255.00                                         Max.   :100.00  
##                                                         NA's   :98      
##  pokedex_number   sp_attack        sp_defense         speed       
##  Min.   :  1    Min.   : 10.00   Min.   : 20.00   Min.   :  5.00  
##  1st Qu.:201    1st Qu.: 45.00   1st Qu.: 50.00   1st Qu.: 45.00  
##  Median :401    Median : 65.00   Median : 66.00   Median : 65.00  
##  Mean   :401    Mean   : 71.31   Mean   : 70.91   Mean   : 66.33  
##  3rd Qu.:601    3rd Qu.: 91.00   3rd Qu.: 90.00   3rd Qu.: 85.00  
##  Max.   :801    Max.   :194.00   Max.   :230.00   Max.   :180.00  
##                                                                   
##     type1              type2             weight_kg        generation  
##  Length:801         Length:801         Min.   :  0.10   Min.   :1.00  
##  Class :character   Class :character   1st Qu.:  9.00   1st Qu.:2.00  
##  Mode  :character   Mode  :character   Median : 27.30   Median :4.00  
##                                        Mean   : 61.38   Mean   :3.69  
##                                        3rd Qu.: 64.80   3rd Qu.:5.00  
##                                        Max.   :999.90   Max.   :7.00  
##                                        NA's   :20                     
##   is_legendary    
##  Min.   :0.00000  
##  1st Qu.:0.00000  
##  Median :0.00000  
##  Mean   :0.08739  
##  3rd Qu.:0.00000  
##  Max.   :1.00000  
## 
```

Check NA

```r
pokemon %>% naniar::miss_var_summary()
```

```
## # A tibble: 41 × 3
##    variable         n_miss pct_miss
##    <chr>             <int>    <dbl>
##  1 type2               384    47.9 
##  2 percentage_male      98    12.2 
##  3 height_m             20     2.50
##  4 weight_kg            20     2.50
##  5 abilities             0     0   
##  6 against_bug           0     0   
##  7 against_dark          0     0   
##  8 against_dragon        0     0   
##  9 against_electric      0     0   
## 10 against_fairy         0     0   
## # ℹ 31 more rows
```




It is observed that the variable named'type2' has many blank observations, so we replace them with none.


```r
pokemon <- pokemon %>%
  mutate_all(~ifelse( .== "", NA, .))%>%
  mutate(type2 = replace_na(type2, 'none'))
```




#### Group_by: Generation

Number of Pokémon Introduced in Each Generation:

```r
pokemon_per_gen <- table(pokemon$generation);pokemon_per_gen
```

```
## 
##   1   2   3   4   5   6   7 
## 151 100 135 107 156  72  80
```



```r
# Plot
ggplot(data = as.data.frame(pokemon_per_gen), aes(x = reorder(Var1, Freq), y = Freq)) + geom_bar(stat = "identity", fill = "lightskyblue") +
  labs(x = "Generation", y = "Number of Pokémon", title = "Pokémon Introduced per Generation") +
  coord_flip()+
  theme_light()
```

![](Final_Project_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

Prevalence of Pokémon Types in Each Generation:

```r
# Count primary types per generation
type_per_gen <- aggregate(cbind(type1) ~ generation, data = pokemon, FUN = function(x) length(unique(x)));type_per_gen
```

```
##   generation type1
## 1          1    15
## 2          2    16
## 3          3    16
## 4          4    17
## 5          5    17
## 6          6    17
## 7          7    16
```

```r
# Plot
ggplot(data = type_per_gen, aes(x = as.numeric(generation), y = type1)) +
  geom_line() +
  geom_point() +
  labs(x = "Generation", y = "Unique Primary Types", title = "Diversity of Primary Pokémon Types per Generation") +
  theme_light()
```

![](Final_Project_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


2. Statistic Trends
Evolution of Average Stats:


```r
avg_stats_per_gen <- aggregate(cbind(hp, attack, defense, sp_attack, sp_defense, speed) ~ generation, data = pokemon, mean)

# Melting the data for easier plotting
library(reshape2)
```

```
## 
## Attaching package: 'reshape2'
```

```
## The following object is masked from 'package:tidyr':
## 
##     smiths
```

```r
melted_data <- melt(avg_stats_per_gen, id.vars = "generation")

# Plot
ggplot(melted_data, aes(x = generation, y = value, color = variable)) +
  geom_line() +
  geom_point() +
  labs(x = "Generation", y = "Average Stat Value", title = "Evolution of Average Stats per Generation") +
  facet_wrap(~ variable)+
  theme_minimal()
```

![](Final_Project_files/figure-html/unnamed-chunk-10-1.png)<!-- -->
Distribution of Legendary Pokémon Across Generations:


```r
# Count legendary Pokémon per generation
legendary_per_gen <- aggregate(is_legendary ~ generation, data = pokemon, sum)

# Plot
ggplot(data = legendary_per_gen, aes(x = generation, y = is_legendary)) +
  geom_bar(stat = "identity", fill = "gold") +
  labs(x = "Generation", y = "Number of Legendary Pokémon", title = "Legendary Pokémon per Generation") +
  theme_minimal()
```

![](Final_Project_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

Capture Rate Change Across Generations:


```r
pokemon$capture_rate <- as.numeric(as.character(pokemon$capture_rate))
```

```
## Warning: NAs introduced by coercion
```

```r
capture_rate_per_gen <- aggregate(capture_rate ~ generation, data = pokemon, mean)

ggplot(data = capture_rate_per_gen, aes(x = generation, y = capture_rate)) +
  geom_line(color = "blue") +
  geom_point(color = "red", size = 2) +
  labs(x = "Generation", y = "Average Capture Rate", title = "Average Capture Rate Change Across Generations") +
  theme_minimal()
```

![](Final_Project_files/figure-html/unnamed-chunk-12-1.png)<!-- -->






```r
against_columns <- grep("against_", names(pokemon), value = TRUE)

# Calculate the mean of 'against_' variables for each generation
avg_against_per_gen <- pokemon %>%
  group_by(generation) %>%
  summarise_at(vars(against_columns), mean, na.rm = TRUE) %>%
  gather(key = "against_type", value = "mean_value", -generation)
```

```
## Warning: Using an external vector in selections was deprecated in tidyselect 1.1.0.
## ℹ Please use `all_of()` or `any_of()` instead.
##   # Was:
##   data %>% select(against_columns)
## 
##   # Now:
##   data %>% select(all_of(against_columns))
## 
## See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```r
# Plot
ggplot(avg_against_per_gen, aes(x = generation, y = mean_value, color = against_type)) +
  geom_line() +
  geom_point() +
  labs(x = "Generation", y = "Average Against Value", title = "Average 'Against' Values per Generation") +
  theme_minimal() +
  facet_wrap(~ against_type)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  #labels readability
  scale_color_viridis_d() 
```

![](Final_Project_files/figure-html/unnamed-chunk-13-1.png)<!-- -->







