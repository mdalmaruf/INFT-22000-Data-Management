CREATE DATABASE StudentEnrollmentDB;
USE StudentEnrollmentDB;

CREATE TABLE Staff (
    StaffNo INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Registered DATE NOT NULL,
    Region VARCHAR(50) NOT NULL,
    StaffNo INT,
    FOREIGN KEY (StaffNo) REFERENCES Staff(StaffNo) ON DELETE SET NULL
);

CREATE TABLE Course (
    CourseCode VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credit INT CHECK (Credit IN (15, 30)), 
    Quota INT NOT NULL,
    StaffNo INT,
    FOREIGN KEY (StaffNo) REFERENCES Staff(StaffNo) ON DELETE SET NULL
);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseCode VARCHAR(10),
    DateEnrolled DATE NOT NULL,
    FinalGrade INT CHECK (FinalGrade BETWEEN 0 AND 100),
    PRIMARY KEY (StudentID, CourseCode),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode) ON DELETE CASCADE
);

CREATE TABLE Assignment (
    AssignmentNo INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseCode VARCHAR(10),
    Grade INT CHECK (Grade BETWEEN 0 AND 100),
    FOREIGN KEY (StudentID, CourseCode) REFERENCES Enrollment(StudentID, CourseCode) ON DELETE CASCADE
);

INSERT INTO Staff (Name, Region) VALUES 
('Dr. Smith', 'North'),
('Prof. Johnson', 'South');

INSERT INTO Student (Name, Registered, Region, StaffNo) VALUES 
('Alice Brown', '2024-01-10', 'North', 1),
('Bob White', '2024-01-15', 'South', 2);

INSERT INTO Course (CourseCode, Title, Credit, Quota, StaffNo) VALUES 
('CS101', 'Intro to Programming', 15, 50, 1),
('CS102', 'Software Engineering', 30, 40, 2);

INSERT INTO Enrollment (StudentID, CourseCode, DateEnrolled, FinalGrade) VALUES 
(1, 'CS101', '2024-02-01', 85),
(2, 'CS102', '2024-02-02', 78);

INSERT INTO Assignment (StudentID, CourseCode, Grade) VALUES 
(1, 'CS101', 90),
(2, 'CS102', 75);


SELECT s.StudentID, s.Name, e.CourseCode, c.Title, e.FinalGrade
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseCode = c.CourseCode;


SELECT a.StudentID, s.Name, a.CourseCode, a.AssignmentNo, a.Grade
FROM Assignment a
JOIN Student s ON a.StudentID = s.StudentID
WHERE s.Name = 'Alice Brown';