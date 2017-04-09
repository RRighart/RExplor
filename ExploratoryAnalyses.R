# Create a small dataset: 100m sprint
df<-data.frame(subject=as.factor(c("Pierre","Anne","Joyce","Peter","Alan","Camille")), age=as.numeric(c(20, 16, 19, 99, 23, 18)), sex=as.factor(c("M","F","F","M",NA,"F")), height=as.numeric(c(172, 181, 165, 168, 177, 178)), speed=as.numeric(c(11.20,3.00,11.50,10.35,10.98,13.05)))

# Check the data.frame df by simply typing in:
df

# The data has 6 rows and 5 columns:
dim(df)

# If you have very big data you may want to view only the first lines:
head(df, 4)

# To inspect the structure of the data: 
str(df)

# Some basic statistics can be given by the summary command:
summary(df)

# To examine if missing values (NA) are in the data:
is.na(df)

# If you want the row and column index where NAs occur:
which(is.na(df), arr.ind=T)

# We can use boxplots to see if there are impossible extreme values:
par(mfrow=c(1,3))
boxplot(df$age, main="Age (yrs)", cex.lab=2.0, cex.axis=2.0, cex.main=1.6, cex=2.0, col="yellow")
boxplot(df$height, main="Height (cm)", cex.lab=2.0, cex.axis=2.0, cex.main=1.6, cex=2.0, col="red")
boxplot(df$speed, main="Speed (ms)", cex.lab=2.0, cex.axis=2.0, cex.main=1.6, cex=2.0, col="orange")

# Finding & replacing the extreme values manually
# Compute the mean before we remove the outliers:
mean(df$age)

# Check if there are cases that are older than 40 years:
df$age>40

# Replace the case(s) older than 40 with a missing value (NA).
df$age[df$age>40]<-NA

# Compute again the mean age, allowing to remove missing values (NAs):
mean(df$age, na.rm=TRUE)

# Inspecting mean age for male and female participants
aggregate(age ~ sex, data=df, FUN=mean, na.rm=TRUE)

# Use a scatterplot to display the relation between age and speed:
par(mfrow=c(1,1))
plot(speed ~ age, data=df, col="blue", pch=1, cex=1.2)

# Quiz questions & answers
# Quiz Question I

# Replace the outlier of 3.00 ms in the variable *df$speed* with a NA.

# There are multiple solutions possible:

df$speed[df$speed==3.00]<-NA

# Another solution:

df[2,5]<-NA

# To verify that the value was indeed replaced by a NA use the command `is.na`:

is.na(df$speed)

# Quiz Question II

# A dataset could erroneously have double records (duplicates). This is bad and should be removed. 
# Seeing the current dataset, what would be a way to discover duplicates in the variable df$subject?
# Check your solution for the following data.frame that contains double data:

df<-data.frame(subject=as.factor(c("Pierre","Anne","Joyce","Peter","Alan","Camille", "Pierre")), age=as.numeric(c(20, 16, 19, 99, 23, 18, 20)), sex=as.factor(c("M","F","F","M",NA,"F", "M")), height=as.numeric(c(172, 181, 165, 168, 177, 178, 172)), speed=as.numeric(c(11.20,3.00,11.50,10.35,10.98,13.05, 11.20)))

# Answer :
# A way to inspect for double records is to use the `table` function.

table(df$subject)

# But still simpler, using the `summary` function would also display this:

summary(df)



