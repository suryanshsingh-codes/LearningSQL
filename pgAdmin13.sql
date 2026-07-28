-- MANY TO MANY RELATIONSHIP--


-- ============================================
-- Create the 'students' table
-- This table stores student information.
-- ============================================

CREATE TABLE students (

    -- Unique identifier for each student
    student_id INT PRIMARY KEY,

    -- Name of the student
    student_name VARCHAR(100)
);


-- ============================================
-- Create the 'courses' table
-- This table stores course information.
-- ============================================

CREATE TABLE courses (

    -- Unique identifier for each course
    course_id INT PRIMARY KEY,

    -- Name of the course
    course_name VARCHAR(100)
);


-- ============================================
-- Create the 'student_courses' table
-- This is a junction (mapping) table used to
-- establish a many-to-many relationship between
-- students and courses.
-- ============================================

CREATE TABLE student_courses (

    -- Student ID (references students table)
    student_id INT,

    -- Course ID (references courses table)
    course_id INT,

    -- Composite Primary Key
    -- Ensures a student cannot enroll in
    -- the same course more than once.
    PRIMARY KEY (student_id, course_id),

    -- Foreign Key linking to students table
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    -- Foreign Key linking to courses table
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

-- ============================================
-- Insert sample records into the 'students' table
-- ============================================

INSERT INTO students (student_id, student_name)
VALUES
    (1, 'Aarav'),
    (2, 'Priya'),
    (3, 'Rahul');
-- ============================================
-- Insert sample records into the 'courses' table
-- ============================================

INSERT INTO courses (course_id, course_name)
VALUES
    (101, 'Python Programming'),
    (102, 'Database Management'),
    (103, 'Machine Learning');

-- ============================================
-- Insert sample records into the
-- 'student_courses' mapping table
-- ============================================

INSERT INTO student_courses (student_id, course_id)
VALUES
    -- Student 1 enrolled in Courses 101 and 102
    (1, 101),
    (1, 102),

    -- Student 2 enrolled in Courses 101 and 103
    (2, 101),
    (2, 103),

    -- Student 3 enrolled in Course 102
    (3, 102);
-- ============================================
-- Display all records from the 'students' table
-- ============================================

SELECT * FROM students;


-- ============================================
-- Display all records from the 'courses' table
-- ============================================

SELECT * FROM courses;


-- ============================================
-- Display all records from the
-- 'student_courses' mapping table
-- ============================================

SELECT * FROM student_courses;










--Q1. Show student and course names

SELECT
    -- Student's name
    s.student_name,

    -- Course name
    c.course_name

FROM student_courses AS sc -- main table the intermediate one

JOIN students AS s -- Join the students table to get student details
ON sc.student_id = s.student_id

JOIN courses AS c-- Join the courses table to get course details
ON sc.course_id = c.course_id;