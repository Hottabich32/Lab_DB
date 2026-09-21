SELECT *
	FROM student
	WHERE city IN(SELECT city FROM university WHERE city='ВОРОНЕЖ')
	ORDER BY univ_id, kurs;
	