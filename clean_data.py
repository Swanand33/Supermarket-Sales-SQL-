import pandas as pd

# Load the dataset
file_path = 'C:\Users\Swanand Potnis\Desktop\supermarket_sales.csv'  
df = pd.read_csv(file_path)

# Convert Date to datetime format
df['Date'] = pd.to_datetime(df['Date'])

# Convert Time to datetime.time format
df['Time'] = pd.to_datetime(df['Time']).dt.time

# Display the data types to confirm changes
print(df.dtypes)

# Display unique values for categorical columns
categorical_columns = ['Branch', 'City', 'Customer type', 'Gender', 'Product line', 'Payment']
unique_values = {col: df[col].unique() for col in categorical_columns}

print(unique_values)

# Save the cleaned data to a new CSV file
df.to_csv('cleaned_supermarket_sales.csv', index=False)
