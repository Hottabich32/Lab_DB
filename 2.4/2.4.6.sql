SELECT subj_name, MAX(semestr)
	FROM subject
	GROUP BY subj_name;

	