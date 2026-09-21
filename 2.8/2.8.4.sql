SELECT *
	FROM subject
	WHERE hour = (SELECT MAX(hour) FROM subject);