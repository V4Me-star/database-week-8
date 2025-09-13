CREATE DATABASE IF NOT EXISTS student_records_db;
USE student_records_db;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE NOT NULL
);

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL UNIQUE,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    credits INT NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ON DELETE SET NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade VARCHAR(2),
    CONSTRAINT unique_student_course UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

INSERT INTO Students (first_name, last_name, email, enrollment_date) VALUES
('Alice', 'Johnson', 'alice.j@example.edu', '2023-09-01'),
('Bob', 'Williams', 'bob.w@example.edu', '2023-09-01'),
('Charlie', 'Brown', 'charlie.b@example.edu', '2023-09-01');

INSERT INTO Instructors (first_name, last_name, email) VALUES
('Dr. Smith', 'Smith', 'smith.d@example.edu'),
('Prof. Davis', 'Davis', 'davis.p@example.edu');

INSERT INTO Courses (course_name, course_code, credits, instructor_id) VALUES
('Introduction to Computer Science', 'CS101', 3, 1),
('Data Structures and Algorithms', 'CS201', 4, 1),
('Principles of Economics', 'ECON101', 3, 2);

INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B+'),
(2, 1, 'B'),
(3, 3, NULL);