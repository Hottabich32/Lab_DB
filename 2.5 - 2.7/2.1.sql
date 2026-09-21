SELECT stud_id, MIN(mark)
	FROM exams
	GROUP BY stud_id;