SELECT exam_date, AVG(mark)
	FROM exams
	GROUP BY exam_date
	ORDER BY AVG(mark) DESC;