# Hydrangea Course Timetable

**Hydrangea Course Timetable** is a SwiftUI macOS application created by Acan on September 24, 2023. This application allows you to display your course timetable along with useful links to your course materials.

## Features

- **Select Image:** You can choose an image file to display your course timetable.
- **Upload Config:** You can upload a JSON configuration file that contains course information.
- **Folder Path:** Quickly copy the folder path where the application is storing files.

## Getting Started

1. **Select Image:** Click the "Select Image" button to choose an image file that contains your course timetable. The selected image will be displayed in the application.

2. **Upload Config:** Click the "Upload Config" button to upload a JSON configuration file that contains your course information. The configuration file should have the following structure:

   ```json
   {
       "data": [
           {
               "name": "Course Name 1",
               "learn": "https://learn-url-1.com",
               "repo": "https://github-repo-1.com",
               "page": "https://notes-page-1.com"
           },
           {
               "name": "Course Name 2",
               "learn": "https://learn-url-2.com",
               "repo": "https://github-repo-2.com",
               "page": "https://notes-page-2.com"
           },
           // Add more courses as needed
       ]
   }
   ```

   Replace the placeholder values with your course information.

3. **Folder Path:** Click the "Folder Path" button to copy the folder path where the application is storing files to your clipboard.

## Usage

- Once you've selected an image and uploaded the configuration file, your course timetable and links to course materials will be displayed in the application.

- You can click on course names to access the learning materials and click on "GitHub" and "Notes" links to open the respective pages.

## Developer Information

- **Developer:** Acan
- **GitHub:** [https://Zeyu-Xie.github.io/Acan](https://Zeyu-Xie.github.io/Acan)

## Important Notes

- Make sure to provide valid URLs for course learning resources, GitHub repositories, and notes pages in the configuration file.
- The application saves the selected image as "image.png" and the configuration file as "config.json" in the document directory.

Enjoy using **Hydrangea Course Timetable** to keep track of your courses and access learning materials with ease!
