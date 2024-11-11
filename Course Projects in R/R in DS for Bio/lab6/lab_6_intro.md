---
title: "Lab 6 Intro"
date: "2024-01-30"
output: 
  ioslides_presentation: 
    keep_md: yes
---



## Setup
1. Go to iclicker.com and record your attendance.
2. Login to the lab computer (please don't use your personal computer).  
3. Navigate to github.com and login.  
4. Find the class repository "datascibiol" (https://github.com/jmledford3115/datascibiol).  
5. Download a copy the class repository to the desktop.  
6. Clone your repository to the desktop.  
7. Copy the files for today's lab from the class repository and paste them into **your** repository.  
8. Open today's lab in RStudio.  

## Review from last time
### *With a partner, discuss the following questions*
1. What are the characteristics of `tidy` data?  
2. What is the difference between `select` and `filter`?  
3. When is your first midterm?  

## Warm-up
1. Load the `bison.csv` data.


```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.1.4     ✔ readr     2.1.4
## ✔ forcats   1.0.0     ✔ stringr   1.5.1
## ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
## ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
## ✔ purrr     1.0.2     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
## Rows: 8325 Columns: 8
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (3): data_code, animal_code, animal_sex
## dbl (5): rec_year, rec_month, rec_day, animal_weight, animal_yob
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```



2. What are the dimesions and structure of the data?


```
## [1] 8325    8
```



```
## Rows: 8,325
## Columns: 8
## $ data_code     <chr> "CBH01", "CBH01", "CBH01", "CBH01", "CBH01", "CBH01", "C…
## $ rec_year      <dbl> 1994, 1994, 1994, 1994, 1994, 1994, 1994, 1994, 1994, 19…
## $ rec_month     <dbl> 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, …
## $ rec_day       <dbl> 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,…
## $ animal_code   <chr> "813", "834", "B-301", "B-402", "B-403", "B-502", "B-503…
## $ animal_sex    <chr> "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "…
## $ animal_weight <dbl> 890, 1074, 1060, 989, 1062, 978, 1068, 1024, 978, 1188, …
## $ animal_yob    <dbl> 1981, 1983, 1983, 1984, 1984, 1985, 1985, 1985, 1986, 19…
```

3. We are only interested in code, sex, weight, year of birth. Restrict the data to these variables and store the dataframe as a new object.


```
## [1] "data_code"     "rec_year"      "rec_month"     "rec_day"      
## [5] "animal_code"   "animal_sex"    "animal_weight" "animal_yob"
```



4. Pull out the animals born between 1980-1990.




5. How many male and female bison are represented between 1980-1990?


```
## 
##   F   M 
## 414  21
```

6. Between 1980-1990, were males or females larger on average?


```
## [1] 1543.333
```



```
## [1] 1017.314
```

