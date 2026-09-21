SELECT exam_date, SUM(mark)
	FROM exams
	GROUP BY exam_date
	ORDER BY SUM(mark) DESC;