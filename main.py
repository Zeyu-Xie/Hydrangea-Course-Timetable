import json

courses = []

with open("./courses.json", "r", encoding="utf-8") as file:
    courses = json.load(file)

num = len(courses)

print("\n")
print("> Welcome to Hydrangea Course Timetable")
print("> Made by Acan")
print("\n")
for i in range(0, len(courses)):
    print(f"{i+1}. {courses[i]['name']}")
print("\n")

index = 0

while(index<1 or index>num):
    index = input("Please input your course index: ")
    index = int(index)

index = index - 1

print(courses[index]["name"])