CREATE FUNCTION COUNT_STUDENT(@id INT)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;
	SET @result = 0;
	IF EXISTS(SELECT CourseID
					FROM Registration
					WHERE @id=CourseID)
		BEGIN

			SET @result =(Select count(*) from Registration where @id=CourseID)
			RETURN @result
		END	
	RETURN CAST('KHONG TIM THAY KHOA HOC' AS INT)
END
drop function PassOrFail
Select dbo.COUNT_STUDENT(550)
CREATE FUNCTION COUNT_CLASS (@id INT)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;
	SET @result = 0;
	IF EXISTS(SELECT ID
					FROM Person
					WHERE @id=ID)
	BEGIN
		IF EXISTS(SELECT ID
					FROM Person
					WHERE @id=ID and Person.TeacherFlag != 1)
		BEGIN
			RETURN 0;
		END
	ELSE
		BEGIN
			SET @result = (SELECT COUNT(TeacherID)
							FROM Course
							WHERE @id=TeacherID);
		RETURN @result;
		END
	END
	RETURN CAST('KHONG TIM THAY GIAO VIEN' AS INT);
END;


CREATE OR ALTER TRIGGER edit_student
on Registration
INSTEAD OF INSERT,DELETE
AS
BEGIN
	IF (NOT EXISTS (SELECT Course.ID FROM Course
		JOIN
		(SELECT CourseID, COUNT(*) AS number_of_students_will_add
		FROM INSERTED
		GROUP BY CourseID) AS i
		ON i.CourseID=Course.ID
		WHERE NumberOfRemainingSlots >= i.number_of_students_will_add) AND NOT EXISTS( SELECT * FROM deleted))
		BEGIN
			raiserror('FULL Slot Course',16,1);
			rollback;
		END
	ELSE
	BEGIN
		INSERT INTO Registration
		SELECT * FROM INSERTED
		WHERE CourseID IN(
			SELECT Course.ID FROM Course
			JOIN
			(SELECT CourseID, COUNT(*) AS number_of_students_will_add
			FROM INSERTED
			GROUP BY CourseID) AS i
			ON i.CourseID=Course.ID
			WHERE NumberOfRemainingSlots >= i.number_of_students_will_add
		)
		DELETE Registration FROM Registration
		WHERE EXISTS (
			SELECT * FROM 
			Registration JOIN DELETED
			ON
			Registration.StudentID = DELETED.StudentID
		)

		UPDATE Course
		SET NumberOfRemainingSlots-=i.number_of_students_will_add
		FROM Course
			JOIN
			(SELECT CourseID, COUNT(*) AS number_of_students_will_add
			FROM INSERTED
			GROUP BY CourseID) AS i
			ON I.CourseID=Course.ID
			WHERE NumberOfRemainingSlots >= i.number_of_students_will_add
	
		UPDATE Course
		SET NumberOfRemainingSlots+=d.number_of_students_to_delete
		FROM Course
			JOIN
			(SELECT CourseID, COUNT(*) AS number_of_students_to_delete
			FROM deleted
			GROUP BY CourseID) AS d
			ON d.CourseID=Course.ID
	END
END
CREATE OR ALTER TRIGGER update_sutudent
on Registration
INSTEAD OF UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT Course.ID FROM Course
				JOIN(
				SELECT
				CourseID,
				COUNT(*) AS number_of_students_will_transfer
				FROM INSERTED
				WHERE StudentID NOT IN (SELECT StudentID FROM deleted WHERE CourseID=INSERTED.CourseID)
				GROUP BY CourseID
				) AS i
				ON i.CourseID=Course.ID
				WHERE NumberOfRemainingSlots >= i.number_of_students_will_transfer) 
		BEGIN
			raiserror('Can not update',16,1);
			rollback;
		END
	ELSE
	BEGIN
		DELETE Registration FROM Registration
		JOIN DELETED
		ON DELETED.StudentID = Registration.StudentID
		JOIN INSERTED
		ON INSERTED.StudentID = Registration.StudentID
		WHERE INSERTED.CourseID IN(
			SELECT Course.ID FROM Course
				JOIN(
				SELECT
				CourseID,
				COUNT(*) AS number_of_students_will_transfer
				FROM INSERTED
				WHERE StudentID NOT IN (SELECT StudentID FROM deleted WHERE CourseID=INSERTED.CourseID)
				GROUP BY CourseID
				) AS i
				ON i.CourseID=Course.ID
				WHERE NumberOfRemainingSlots >= i.number_of_students_will_transfer
		)
		INSERT INTO Registration
		SELECT * FROM INSERTED 
		WHERE CourseID IN(
			SELECT Course.ID FROM Course
				JOIN(
				SELECT
				CourseID, COUNT(*) AS number_of_students_will_transfer
				FROM INSERTED
				WHERE StudentID NOT IN (SELECT StudentID FROM deleted WHERE CourseID=INSERTED.CourseID)
				GROUP BY CourseID
				) AS i
				ON i.CourseID=Course.ID
				WHERE NumberOfRemainingSlots >= i.number_of_students_will_transfer 
			)
	
		UPDATE c 
		SET NumberOfRemainingSlots= NumberOfRemainingSlots + number_of_students_will_transfer 
		FROM Course AS c
			JOIN(
			SELECT
			CourseID, COUNT(*) AS number_of_students_will_transfer
			FROM deleted
			WHERE StudentID NOT IN (SELECT StudentID FROM INSERTED WHERE CourseID=deleted.CourseID)
			GROUP BY CourseID
			) AS d
			ON d.CourseID=c.ID
			where
				EXISTS (
				SELECT * FROM Course
				JOIN(
				SELECT
				CourseID,
				COUNT(*) AS number_of_students_will_transfer
				FROM INSERTED
				GROUP BY CourseID
				) AS i
				ON i.CourseID=Course.ID
				WHERE NumberOfRemainingSlots >= I.number_of_students_will_transfer)
		UPDATE Course 
		SET NumberOfRemainingSlots= NumberOfRemainingSlots - number_of_students_will_transfer 
		FROM Course
			JOIN(
				SELECT
				CourseID,
				COUNT(*) AS number_of_students_will_transfer
				FROM INSERTED
				WHERE StudentID NOT IN (SELECT StudentID FROM deleted WHERE CourseID=INSERTED.CourseID)
				GROUP BY CourseID
			) AS i
			ON i.CourseID=Course.ID
			WHERE NumberOfRemainingSlots >= I.number_of_students_will_transfer
	END
END
