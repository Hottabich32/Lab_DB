SELECT *
	FROM student
	WHERE stipend > (SELECT AVG(stipend) FROM student);
	