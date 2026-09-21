SELECT stud_id, MAX(mark)
	FROM exams
	GROUP BY stud_id;