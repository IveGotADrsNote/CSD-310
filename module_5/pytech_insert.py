""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.j6x3ar9.mongodb.net/?retryWrites=true&w=majority"

# connect to the MongoDB cluster 
client = MongoClient(url)

# connect pytech database
db = client.pytech

harry = {
   "student_id": "1007",
   "first_name": "Harry",
   "last_name": "Potter",
   "enrollments" : [
		{
			"gpa": 3.6,
			"start_date" : "01/02/2022",
			"end_date"     : "05/16/2022", 
			"student_id"   : "07311990",
			"courses": [
				 {
					"course_id": "DADA301",
					"description": "Third Year Defensive Magic",
					"instructor": "Snape, Severus",
					"grade": "B-" 
				 }
			]
		}
	]
}

zark = {
   "student_id": "1008",
   "first_name": "Zark",
   "last_name": "Muckerburg",
   "enrollments" : [
		{
			"gpa": "4.0",
			"start_date" : "01/02/2022",
			"end_date"     : "05/16/2022", 
			"student_id"   : "1008",
			"courses": [
				 {
					"course_id": "BIO203",
					"description": "How To Look Lizard",
					"instructor": "The Gieco Gecko",
					"grade": "A+" 
				 }
			]
		}
	]
}

geralt = {
   "student_id": "1009",
   "first_name": "Geralt",
   "last_name": "Rivia",
   "enrollments" : [
		{
			"gpa": "3.8",
			"start_date" : "01/02/2022",
			"end_date"     : "05/16/2022", 
			"student_id"   : "1009",
			"courses": [
				 {
					"course_id": "CTWH101",
					"description": "Catching the Wild Hunt",
					"instructor": "Vesemir",
					"grade": "C+" 
				 }
			]
		}
	]
}

# get the students collection 
students = db.students

# insert statements with output 
print("\n  -- INSERT STATEMENTS --")
harry_student_id = students.insert_one(harry).inserted_id
print("  Inserted student record Harry Potter into the students collection with document_id " + str(harry_student_id))

zark_student_id = students.insert_one(zark).inserted_id
print("  Inserted student record Zark Muckerberg into the students collection with document_id " + str(zark_student_id))

geralt_student_id = students.insert_one(geralt).inserted_id
print("  Inserted student record Geralt of Rivia into the students collection with document_id " + str(geralt_student_id))

input("\n\n  End of program, press any key to exit... ")