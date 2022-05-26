library(ggplot2)
library(scales)
titanic <- read.csv("titanic.csv")
titanic

#Data Pre-processing
titanic$Survived = cut(titanic$Survived, breaks = c(-1.0, 0.0, 1.0), labels = c("0", "1"))
titanic$Pclass = cut(titanic$Pclass, breaks = c(0.0, 1.0, 2.0, 3.0), labels = c("1", "2", "3"))
titanic$Familysize = titanic$SibSp + titanic$Parch

#Q1
ggplot(titanic) +
  geom_bar(aes(x = Sex)) +
  ylab("Count") +
  scale_x_discrete("Gender", labels = c("female" = "Female", "male" = "Male")) +
  labs(title = "Distribution of Passengers by Gender")

ggplot(titanic) +
  geom_bar(aes(x = Pclass)) +
  xlab("Ticket Class") +
  ylab("Count") +
  labs(title = "Distribution of Passengers by Ticket Class")

ggplot(titanic) +
  geom_bar(aes(x = Survived)) +
  xlab("Survival Status") +
  ylab("Count") +
  labs(title = "Distribution of Passengers by Survival Status")

#Q2
ggplot(titanic) +
  geom_histogram(aes(x = Age), binwidth = 5) +
  ylab("Count") +
  labs(title = "Distribution of Passengers by Age")

ggplot(titanic) +
  geom_boxplot(aes(x = Pclass, y = Age)) +
  xlab("Ticket Class") +
  labs(title = "Distribution of Passengers by Ticket Class and Age")

ggplot(titanic) +
  geom_boxplot(aes(x = Survived, y = Age)) +
  xlab("Survival Status") +
  labs(title = "Distribution of Passengers by Survival Status and Age")

#Q3
ggplot(titanic) +
  geom_histogram(aes(x = Fare), bins = 5) +
  xlab("Travel Fare") +
  ylab("Count") +
  labs(title = "Distribution of Passengers by Travel Fare")

table(titanic$Fare == 0)

#Q4
ggplot(titanic) +
  geom_histogram(aes(x = Familysize, fill = Pclass), binwidth = 1) +
  xlab("Family Size") +
  ylab("Count") +
  scale_x_continuous(labels = label_number(accuracy = 1)) +
  labs(fill = "Ticket Class", title = "Distribution of Passengers by Family Size and Ticket Class")

#Q5
ggplot(titanic) +
  geom_bar(aes(x = Sex, fill = Survived)) +
  ylab("Count") +
  scale_x_discrete("Sex", labels = c("female" = "Female", "male" = "Male")) +
  labs(title = "Distribution of Passengers by Sex and Survival Status")

ggplot(titanic) +
  geom_bar(aes(x = Pclass, fill = Survived)) +
  xlab("Ticket Class") +
  ylab("Count") +
  labs(title = "Distribution of Passengers by Ticket Class and Survival Status")

#Q6
ggplot(titanic) +
  geom_violin(aes(x = Survived, y = Age, fill = Sex)) +
  labs(title = "Distribution of Passengers by Survival Status, Age and Sex")

#Q7
ggplot(titanic) +
  geom_violin(aes(x = Survived, y = Age, fill = Pclass)) +
  labs(fill = "Ticket Class", title = "Distribution of Passengers by Survival Status, Age and Ticket Class")