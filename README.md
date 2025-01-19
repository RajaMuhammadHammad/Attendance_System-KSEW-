
# Attendance System - KSEW

## Project Overview
This repository contains the **Attendance System** developed during my internship at Karachi Shipyard & Engineering Works (KSEW). The system was designed to streamline attendance management by integrating **MySQL** and **Oracle SQL Developer**. Attendance data was initially stored in MySQL and then converted to match the IFS (Industrial and Financial Systems) ID format before being saved into the Oracle database for further processing. This multi-database approach ensured seamless integration with the organization's existing ERP system.

---

## Features
- **Multi-Database Workflow**:
  - Attendance data is first recorded in **MySQL**.
  - The system converts the **Attendance ID** into the corresponding **IFS Employee ID**.
  - The converted records are saved into the **Oracle Database** for final processing.  
- **ERP Integration**: Tailored to work with the IFS system used by the organization.  
- **Custom Reporting**: Generate attendance reports with user-defined filters.  
- **Data Validation**: Ensures accurate mapping of Attendance IDs to Employee IFS IDs.  
- **User-Friendly Front-End**: Built using **ASP.NET Framework** for ease of use.

---

## Technologies Used
- **ASP.NET Framework**: For developing the front-end interface.  
- **MySQL**: Used for storing raw attendance data.  
- **Oracle SQL Developer**: Utilized for storing and processing attendance records after ID conversion.  
- **SQL Queries**: Extensive use of queries for data manipulation, validation, and reporting.  
- **Data Mapping Logic**: Implemented to convert Attendance IDs to IFS Employee IDs.

---

## Workflow Overview
1. **Data Entry**: Attendance is recorded in the MySQL database.  
2. **ID Conversion**: The system maps Attendance IDs to their corresponding IFS Employee IDs.  
3. **Data Transfer**: The converted records are stored in the Oracle database.  
4. **Reporting**: Attendance data can be retrieved and displayed based on user-defined filters.

---

## How to Run the Project
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/RajaMuhammadHammad/Attendance_System-KSEW-.git
   ```
2. **Set Up the Databases**:
   - **MySQL**: Import the provided `.sql` file into your MySQL server to create the initial attendance database.  
   - **Oracle SQL Developer**: Use the provided SQL scripts to set up the schema for the Oracle database.  
3. **Configure Database Connections**:
   - Update the database connection strings in the `Web.config` file to point to your MySQL and Oracle databases.  
4. **Run the Application**:
   - Open the project solution in **Visual Studio**.
   - Build and run the project to start the application.

---

## Learning Outcomes
- Gained hands-on experience with **multi-database systems** and their integration.  
- Learned the practical applications of **data mapping** between different database systems.  
- Improved my skills in **database optimization** and handling enterprise-level data.  
- Developed an understanding of **ERP system integration**, particularly with IFS.  
- Enhanced proficiency in using **ASP.NET Framework** for building robust interfaces.

---
