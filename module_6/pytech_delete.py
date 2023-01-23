from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.j6x3ar9.mongodb.net/?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

# get the students collection 
students = db.students

# find all students in the collection 
student_list = students.find({})

# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

# loop over the collection and output the results 
for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

# test document 
kaneki = {
    "student_id": "1010",
    "first_name": "Ken",
    "last_name": "Kaneki"
}

# insert the test document into MongoDB atlas 
kaneki_student_id = students.insert_one(kaneki).inserted_id

# insert statements with output 
print("\n  -- INSERT STATEMENTS --")
print("  Inserted student record into the students collection with document_id " + "str(kaneki_student_id)")

# call the find_one() method by student_id 1010
kaneki = students.find_one({"student_id": "1010"})

# display the results 
print("\n  -- DISPLAYING STUDENT TEST DOC -- ")
print("  Student ID: " + kaneki["student_id"] + "\n  First Name: " + kaneki["first_name"] + "\n  Last Name: " + kaneki["last_name"] + "\n")

# call the delete_one method to remove the student_test_doc
deleted_student_test_doc = students.delete_one({"student_id": "1010"})

# find all students in the collection 
new_student_list = students.find({})

# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

# loop over the collection and output the results 
for doc in new_student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

# exit message 
input("\n\n  End of program, press any key to continue...")
