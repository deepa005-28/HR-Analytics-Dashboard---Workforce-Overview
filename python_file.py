import pandas as pd
import numpy as np

# Reading CSV file and storing dataset into df
df = pd.read_csv("HR-Analytics-Dataset.csv")

# Checking data
df.info()
print(df.isnull().sum())

# Removing duplicate values
df.drop_duplicates(inplace=True)

# Creating age groups
df["Age_Group"] = pd.cut(df["Age"], bins=[18, 25, 35, 45, 55, 65], labels=["18-25", "26-35", "36-45", "46-55", "56+"]
)

# Creating salary bands
df["Salary_Band"] = pd.cut(
    df["MonthlyIncome"],
    bins=[0, 5000, 10000, 15000, 25000],
    labels=["Low", "Medium", "High", "Very High"]
)

# Creating attrition flag
df["Attrition_Flag"] = df["Attrition"].map({
    "Yes": 1,
    "No": 0
})

# Adding an Experienced-group column
df["Experience_Group"] = pd.cut(df["YearsAtCompany"], bins=[0, 2, 5, 10, 20, 40], labels=["0-2", "3-5", "6-10", "11-20", "20+"])

print(df.columns.tolist())

# Export cleaned dataset
df.to_csv("clean_hr_data.csv", index=False)
print("Cleaned dataset exported successfully!")