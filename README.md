# database-week-8
Student Records Database Schema
This repository contains the SQL script for a basic student records management system. The schema is designed to model the core components of an academic environment, including students, instructors, courses, and their relationships.

Features
Well-Structured Tables: The database is divided into logical tables to store student, instructor, and course information.

Relationships: The schema establishes clear relationships, including a one-to-many relationship between Instructors and Courses, and a many-to-many relationship between Students and Courses handled by the Enrollments table.

Constraints: The tables use appropriate constraints like PRIMARY KEY, FOREIGN KEY, NOT NULL, and UNIQUE to ensure data integrity.

Sample Data: The script includes INSERT statements to populate the tables with sample data, making it easy to test and explore the database immediately.

Database Schema
The database consists of four main tables:

Students

student_id: Primary key, auto-incrementing.

first_name, last_name: Student's name.

email: Unique email address for the student.

enrollment_date: The date the student was enrolled.

Instructors

instructor_id: Primary key, auto-incrementing.

first_name, last_name: Instructor's name.

email: Unique email address for the instructor.

Courses

course_id: Primary key, auto-incrementing.

course_name, course_code: Unique course identifiers.

credits: The number of credits for the course.

instructor_id: Foreign key linking to the Instructors table.

Enrollments

enrollment_id: Primary key, auto-incrementing.

student_id: Foreign key linking to the Students table.

course_id: Foreign key linking to the Courses table.

enrollment_date: The date of enrollment in the course.

grade: The grade received by the student (e.g., 'A', 'B+'). This can be NULL if the grade has not been assigned yet.
