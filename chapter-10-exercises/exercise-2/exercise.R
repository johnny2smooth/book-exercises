# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)

employees
# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
?runif()
salaries_2017 <- runif(100, min = 40000, max = 50000)

salaries_2017
# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salary_adjustments <- runif(100, min = -5000, max = 10000)

salary_adjustments
# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries_2017, salary_adjustments, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salaries_2018 <- salaries_2017 + salary_adjustments

salaries
# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- salary_adjustments > 0

salaries
### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[57, "salaries_2018"]

# How many employees got a raise?
nrow(salaries[salaries$raise == TRUE, ])

# What was the dollar value of the highest raise?
highest_raise <- max(salaries$salary_adjustments, na.rm = FALSE)
#9851.796

# What was the "name" of the employee who received the highest raise?
biggest_winner <- salaries[salaries$salary_adjustments == highest_raise, "employees"]
#Employee 6

# What was the largest decrease in salaries between the two years?
highest_decrease <- min(salaries$salary_adjustments, na.rm = FALSE)
#-4996.605

# What was the name of the employee who recieved largest decrease in salary?
biggest_loser <- salaries[salaries$salary_adjustments == highest_decrease, "employees"]

biggest_loser
# What was the average salary change?
?mean()
average_salary_change <- mean(salaries$salary_adjustments)

average_salary_change
# For people who did not get a raise, how much money did they lose on average?
average_salary_decrease <- mean(salaries$salary_adjustments[salaries$raise == FALSE])

average_salary_decrease
## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
getwd()
write.csv(salaries, "exercise-2-df.csv", row.names = FALSE)

