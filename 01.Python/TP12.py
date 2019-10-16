import os


# create multiplication tables in a string to be written in files
st = ""
for table in range(1, 11):
    st += f"\nLa table de multiplication de {table}\n"
    for m in range(1, 11):
        st += f"{table} x {m} = {table*m}\n"

print(st) # for testing purpose

# create directories if they don't exist and put the file in each dir
dir_list = ["E1", "E2", "E3", "E4", "E5"]
file_name = "Table_de_multiplication.txt"
for d in dir_list:
    if not os.path.exists(d):
        os.makedirs(d)
    current_file_path = os.path.join(os.getcwd(), d, file_name)
    with open(current_file_path, "w") as file:
        file.write(st)
