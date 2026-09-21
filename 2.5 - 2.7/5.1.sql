SELECT exam_date, MIN(mark)
	FROM exams
	GROUP BY exam_date
	ORDER BY MIN(mark) DESC;