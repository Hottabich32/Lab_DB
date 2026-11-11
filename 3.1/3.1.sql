INSERT INTO subject
	VALUES(201,'Алгебра',72,4);

INSERT INTO student 
	VALUES(61,'Орлов','Николай',NULL,1,'ВОРОНЕЖ',NULL,1);

DELETE FROM exams
	WHERE stud_id = 100;

UPDATE university
	SET rating = rating + 5
	WHERE city = 'САНКТ-ПЕТЕРБУРГ';

UPDATE student
	SET city = 'ВОРОНЕЖ'
	WHERE name = 'Иванов';
