CREATE PROCEDURE InsertTeacher 
	@FullName	VARCHAR(100),
	@SSN		VARCHAR(20),
	@username	VARCHAR(50),
	@password	VARCHAR(50),
	@CertID		VARCHAR(30),
	@Bdate		DATE			= NULL,
	@Address	VARCHAR(200)	= NULL
AS BEGIN
	
	INSERT INTO Person (ID, FullName, SSN, Bdate, Address, username, password, CertID, TeacherFlag)
	VALUES ((SELECT COALESCE(Max(ID) + 1, 10001) FROM Person WHERE TeacherFlag = 1), 
			@FullName, @SSN, @Bdate, @Address, @username, @password, @CertID, 1)
END

CREATE PROCEDURE InsertStaff 
	@FullName	VARCHAR(100),
	@SSN		VARCHAR(20),
	@username	VARCHAR(50),
	@password	VARCHAR(50),
	@Work		VARCHAR(30),
	@Bdate		DATE			= NULL,
	@Address	VARCHAR(200)	= NULL
AS BEGIN
	
	INSERT INTO Person (ID, FullName, SSN, Bdate, Address, username, password, Work, StaffFlag)
	VALUES ((SELECT COALESCE(Max(ID) + 1, 10001) FROM Person WHERE StaffFlag = 1), 
			@FullName, @SSN, @Bdate, @Address, @username, @password, @Work, 1)
END

CREATE PROCEDURE InsertStudent
	@FullName	VARCHAR(100),
	@username	VARCHAR(50),
	@password	VARCHAR(50),
	@SSN		VARCHAR(20)		= NULL,
	@Bdate		DATE			= NULL,
	@Address	VARCHAR(200)	= NULL
AS BEGIN
	
	INSERT INTO Person (ID, FullName, SSN, Bdate, Address, username, password, StudentFlag)
	VALUES ((SELECT COALESCE(Max(ID) + 1, 10001) FROM Person WHERE StudentFlag = 1), 
			@FullName, @SSN, @Bdate, @Address, @username, @password, 1)
END