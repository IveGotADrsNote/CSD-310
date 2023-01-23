from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.j6x3ar9.mongodb.net/?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

students = db.students

# find all students in the collection 
student_list = students.find({})

# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

# loop over the collection and output the results 
for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

# update student_id 1007
result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Walberg"}})

# find the updated student document 
harry = students.find_one({"student_id": "1007"})

# display message
print("\n  -- STUDENT DOCUMENT 1007 --")

# output the updated document to the terminal window
print("  Student ID: " + harry["student_id"] + "\n  First Name: " + harry["first_name"] + "\n  Last Name: " + harry["last_name"] + "\n")

# exit message 
input("\n\n  --END")