SELECT stud_id, surname, (stipend*1.2)
	FROM student
	GROUP BY stud_id
	ORDER BY MIN(surname);
	