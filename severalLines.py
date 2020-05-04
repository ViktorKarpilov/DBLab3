import pandas as pd  

dataset = pd.read_csv(r'../incedents.csv')

print(dataset.tail(4))
print("done")

print(dataset[['Source','Severity','Start_Time', 'End_Time','Street', 'Side', 'City', 'Country', 'State']].tail(5))