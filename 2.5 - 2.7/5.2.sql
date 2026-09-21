SELECT exam_date, MAX(mark)
	FROM exams
	GROUP BY exam_date
	ORDER BY MAX(mark) DESC;