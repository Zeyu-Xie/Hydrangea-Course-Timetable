import json
import webbrowser

def inputIndex():
    idx = 0
    while (idx < 1 or idx > num):
        idx = input("> Please input your course index: ")
        idx = int(idx)
    idx = idx - 1
    print("  ok")
    print("\n")
    return idx

def inputType():
    tp = 0
    while (tp < 1 or tp > 3):
        print("> Which page do you need to open?")
        print("  1. 网络学堂")
        print("  2. GitHub")
        print("  3. GitHub Pages")
        tp = input("> Input the index: ")
        tp = int(tp)
    return tp

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

index = inputIndex()

type = inputType()


if (type == 1):
    webbrowser.open(courses[index]["learnx"])
elif (type == 2):
    webbrowser.open(courses[index]["github"])
else:
    webbrowser.open(courses[index]["notes"])


