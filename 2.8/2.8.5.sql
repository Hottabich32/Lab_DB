SELECT name, surname
	FROM student
	WHERE city NOT IN(SELECT city FROM university);