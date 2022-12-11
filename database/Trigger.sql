CREATE OR ALTER TRIGGER checkPerson 
ON Person
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @teacherFlag INT
	DECLARE @studentFlag INT
	DECLARE @staffFlag INT
	DECLARE @certID varChar(30)
	DECLARE @work varChar(30)
	DECLARE @password varChar(50)
	DECLARE @flag INT
	SET @flag = 0 

	SELECT @teacherFlag = TeacherFlag, @studentFlag = StudentFlag, @staffFlag = StaffFlag, @certID = CertID, @work = Work, @password = password  from inserted
	
	IF(LEN(@password) < 8 )
	BEGIN
		RAISERROR('password must be at least 8 characters', 16, 1)
		SET @flag = @flag + 1
	END

	IF(@password LIKE '%[^a-zA-Z0-9]%')
	BEGIN
		RAISERROR('password only contains letters and numbers', 16, 1)
		SET @flag = @flag + 1
	END


	IF(@teacherFlag + @studentFlag + @staffFlag = 0) 
	BEGIN
		RAISERROR('person entering must have a role', 16, 1)
		SET @flag = @flag + 1
	END
	
	IF(@teacherFlag + @studentFlag + @staffFlag > 1)
	BEGIN
		RAISERROR('person entering has only one role', 16, 1)
		SET @flag = @flag + 1
	END

	IF(@teacherFlag = 1 AND @certID IS NULL)
	BEGIN
		RAISERROR('teacher must have cert', 16, 1)
		SET @flag = @flag + 1
	END

	IF(@staffFlag = 1 AND @work IS NULL)
	BEGIN
		RAISERROR('staff must have job', 16, 1)
		SET @flag = @flag + 1
	END

	IF(NOT(@flag = 0 ))
	BEGIN
		PRINT 'Total error is '+ CONVERT(varChar, @flag, 1)
		ROLLBACK
	END
	
END;



CREATE OR ALTER TRIGGER deletePerson
ON Person
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @teacherFlag	INT
	DECLARE @studentFlag	INT
	DECLARE @staffFlag		INT
	DECLARE @ID				INT
	
	DECLARE personDelete_cursor CURSOR FOR 
	SELECT ID, TeacherFlag, StudentFlag, StaffFlag FROM DELETED
	OPEN personDelete_cursor
	FETCH NEXT FROM personDelete_cursor INTO @ID, @teacherFlag, @studentFlag, @staffFlag
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF(@teacherFlag = 1)
		BEGIN
			DECLARE @flag INT
			SET @flag = 0
			
			IF(EXISTS(SELECT * FROM Course WHERE @ID = TeacherID))
			BEGIN
				RAISERROR(N'Giang vien %d dang la giang vien truong, thay doi truoc khi xoa' , 16, 1, @ID)
				SET @flag = @flag + 1
			END

			IF(EXISTS(SELECT * FROM Lesson WHERE @ID = TeacherID))
			BEGIN
				RAISERROR(N'Giang vien %d dang co lop day, thay doi truoc khi xoa', 16, 1, @ID)
				SET @flag = @flag + 1
			END
			
			IF(@flag = 0)
			BEGIN
				DELETE FROM Email WHERE @ID = PersonID
				DELETE FROM Phone WHERE @ID = PersonID
				DELETE FROM Person WHERE @ID = ID
			END
			ELSE 
			BEGIN
				ROLLBACK 
			END
		END

		IF(@staffFlag = 1)
		BEGIN
			DELETE FROM Work WHERE @ID = StaffID
			IF(EXISTS(SELECT * FROM Branch WHERE @ID = ManagerID))
			BEGIN 
				RAISERROR(N'Nhan vien %d dang la quan ly chi nhanh, thay doi truoc khi xoa', 16, 1, @ID)
				ROLLBACK
			END
			ELSE
			BEGIN
				DELETE FROM Email WHERE @ID = PersonID
				DELETE FROM Phone WHERE @ID = PersonID
				DELETE FROM Person WHERE @ID = ID
			END
		END

		IF(@studentFlag = 1)
		BEGIN
			DELETE FROM Email WHERE @ID = PersonID
			DELETE FROM Phone WHERE @ID = PersonID
			DELETE FROM Dependent WHERE @ID = StudentID
			DELETE FROM Payment WHERE @ID = StudentID
			DELETE FROM Registration WHERE @ID = StudentID
			DELETE FROM Attendance WHERE @ID = StudentID
			DELETE FROM Person WHERE @ID = ID
		END

		FETCH NEXT FROM personDelete_cursor INTO @ID, @teacherFlag, @studentFlag, @staffFlag
	END

	CLOSE personDelete_cursor
	DEALLOCATE personDelete_cursor
END;
