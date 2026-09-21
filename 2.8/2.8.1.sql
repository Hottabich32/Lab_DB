SELECT *
	FROM student
	WHERE stipend = (SELECT MAX(stipend) FROM student)
	ORDER BY surname;