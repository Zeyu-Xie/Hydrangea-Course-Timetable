import json
import webbrowser
import sys

def getCourses():
    cs = []
    with open("./courses.json", "r", encoding="utf-8") as file:
        cs = json.load(file)
    return cs

def inputIndex():

    print("")
    print("> Welcome to Hydrangea Course Timetable")
    print("> Made by Acan")
    print("")
    for i in range(0, len(courses)):
        print(f"{i+1}. {courses[i]['name']}")
    print("0. (Back)")
    print("")

    idx = -1
    while (idx < 0 or idx > num):
        idx = input("> Please input your course index: ")
        idx = int(idx)

    idx = idx - 1
    print("> ok")
    print("")
    return idx

def inputType(idx):
    tp = -1
    while (tp < 0 or tp > 3):
        print(f"> Your choice is {courses[idx]['name']}")
        print("> Which page do you need to open?")
        print("  1. 网络学堂")
        print("  2. GitHub")
        print("  3. GitHub Pages")
        print("  0. (Back)")
        tp = input("> Input the index: ")
        tp = int(tp)
    print("> ok")
    print("")
    return tp

def openWebsite(idx, tp):
    if (tp == 1):
        webbrowser.open(courses[idx]["learnx"])
    elif (tp == 2):
        webbrowser.open(courses[idx]["github"])
    else:
        webbrowser.open(courses[idx]["notes"])


courses = getCourses()
num = len(courses)

certain = 0

while(certain == 0):
    index = inputIndex()

    if(index == -1): 
        break

    type = inputType(index)
    if(type == 0): 
        certain = 0
    else:
        certain = 1
        openWebsite(index, type)