/* Independent tables */
CREATE TABLE Person (
	ID			INT				PRIMARY KEY,
	Fullname	VARCHAR(100)	NOT NULL,
	SSN			VARCHAR(20),
	Bdate		DATE,
	Address		VARCHAR(200),

	username	VARCHAR(50)		NOT NULL UNIQUE,
	password	VARCHAR(50)		NOT NULL,

	TeacherFlag	INT				NOT NULL DEFAULT 0,
	StudentFlag	INT				NOT NULL DEFAULT 0,
	StaffFlag	INT				NOT NULL DEFAULT 0,

	CertID		VARCHAR(30),
	Work		VARCHAR(30),
	/*
	CHECK (TeacherFlag + StudentFlag + StaffFlag = 1),	/* Exactly one bit is True */
	CHECK (TeacherFlag = 0 OR CertID IS NOT NULL),		/* Teacher must have CertID */
	CHECK (StaffFlag = 0 OR Work IS NOT NULL)			/* Staff must have a work */
	*/
)

CREATE TABLE Promotion(
	ID			INT				NOT NULL PRIMARY KEY,
	Condition	VARCHAR(30),
	Amount		INT,
	Rate		REAL,
	Deadline	DATE
)

CREATE TABLE Program(
	Name			VARCHAR(20)		PRIMARY KEY,
	Language		VARCHAR(10)		NOT NULL,
	Aim				VARCHAR(30)		NOT NULL,
	Prerequisite	VARCHAR(20)
)

CREATE TABLE WorkShift (
	ID			INT			PRIMARY KEY,
	Weekday		CHAR(3)		NOT NULL,
	StartHour	TIME		NOT NULL,
	EndHour		TIME		NOT NULL
)

/* Dependent tables */

CREATE TABLE Branch(
	ID			INT			NOT NULL PRIMARY KEY,
	ManagerID	INT			FOREIGN KEY REFERENCES Person(ID),
	Telephone	VARCHAR(11)	NOT NULL,
	Address		VARCHAR(200)	NOT NULL
)

CREATE TABLE Document (
	ID				INT				NOT NULL,
	ProgramName		VARCHAR(20)		NOT NULL FOREIGN KEY REFERENCES Program(Name),
	Name			VARCHAR(50)		NOT NULL,
	Link			VARCHAR(200)	NOT NULL,
	PublishedDate	DATE

	PRIMARY KEY (ID, ProgramName)
)

CREATE TABLE Outline (
	ID				INT				NOT NULL,
	ProgramName		VARCHAR(20)		NOT NULL FOREIGN KEY REFERENCES Program(Name),
	Content			VARCHAR(100)	NOT NULL,

	PRIMARY KEY (ID, ProgramName)
)

CREATE TABLE Phone (
	PersonID	INT				FOREIGN KEY REFERENCES Person(ID),
	Phone		VARCHAR(11)		NOT NULL,
)

CREATE TABLE Email (
	PersonID	INT				FOREIGN KEY REFERENCES Person(ID),
	Email		VARCHAR(50)		NOT NULL,
)

CREATE TABLE Dependent(
	ID				INT				PRIMARY KEY,
	StudentID		INT				NOT NULL FOREIGN KEY REFERENCES Person(ID),
	FullName		VARCHAR(50)		NOT NULL,
	Relationship	VARCHAR(10)		NOT NULL,
	PhoneNumber		VARCHAR(11),
	Email			VARCHAR(50),
)

CREATE TABLE Course (
	ID			INT			PRIMARY KEY,
	ProgramName	VARCHAR(20)	NOT NULL FOREIGN KEY REFERENCES Program(Name),
	TeacherID	INT			NOT NULL FOREIGN KEY REFERENCES Person(ID),
	StartDate	DATE		NOT NULL,
	EndDate		DATE		NOT NULL,
	Fee			INT			NOT NULL,
	NumberOfRemainingSlots  INT			NOT NULL,
)

CREATE TABLE Work (
	StaffID		INT			FOREIGN KEY REFERENCES Person(ID),
	BranchID	INT			FOREIGN KEY REFERENCES Branch(ID),
	ShiftID		INT			FOREIGN KEY REFERENCES WorkShift(ID),
	Status		BIT			NOT NULL DEFAULT 1,

	PRIMARY KEY (StaffID, BranchID, ShiftID) 
)

CREATE TABLE Registration (
	StudentID		INT			FOREIGN KEY REFERENCES Person(ID),
	CourseID		INT			FOREIGN KEY REFERENCES Course(ID),
	PromotionID		INT			FOREIGN KEY REFERENCES Promotion(ID),
	Fee				INT			NOT NULL,
	inGrade			REAL,
	outGrade		REAL,

	PRIMARY KEY (StudentID, CourseID, PromotionID)
)

CREATE TABLE Room (
	ID			INT		PRIMARY KEY,
	BranchID	INT		NOT NULL FOREIGN KEY REFERENCES Branch(ID),
	Capacity	INT		NOT NULL
)

CREATE TABLE Lesson (
	ID				INT			PRIMARY KEY,
	CourseID		INT			NOT NULL FOREIGN KEY REFERENCES Course(ID),
	RoomID			INT			NOT NULL FOREIGN KEY REFERENCES Room(ID),
	BranchID		INT			NOT NULL FOREIGN KEY REFERENCES Branch(ID),
	TeacherID		INT			NOT NULL FOREIGN KEY REFERENCES Person(ID),

	Date			DATE		NOT NULL,
	StartHour		TIME		NOT NULL,
	EndHour			TIME		NOT NULL,
	Content			VARCHAR(200)
)

CREATE TABLE Attendance (
	StudentID		INT				FOREIGN KEY REFERENCES Person(ID),
	LessonID		INT				FOREIGN KEY REFERENCES Lesson(ID),
	Attending		INT				NOT NULL,
	Note			VARCHAR(200),
	
	PRIMARY KEY (StudentID, LessonID),
	CHECK (Attending = 0 OR Attending = 1),
)

CREATE TABLE Payment(
	ID				INT			PRIMARY KEY,
	StudentID		INT			FOREIGN KEY REFERENCES Person(ID),
	CourseID		INT			FOREIGN KEY REFERENCES Course(ID),
	Money			INT			NOT NULL,
	Date			DATE		NOT NULL,
	Type			VARCHAR(50),
	Remaining		INT			NOT NULL

)
/* Add prerequisite of Program */
ALTER TABLE Program
ADD FOREIGN KEY (Prerequisite) REFERENCES Program(Name)
