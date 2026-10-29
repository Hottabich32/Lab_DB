SELECT univ_name,kurs,COUNT(stud_id)
	FROM university, student
	GROUP BY univ_name, kurs;

SELECT surname, name, subj_name
	FROM lecturer lc JOIN subj_lect sl
	ON lc.lecturer_id = sl.lecturer_id
	JOIN subject sb
	ON sl.subj_id = sb.subj_id;

SELECT surname, name, semestr, SUM(hour)
	FROM lecturer lc, subject sb
	GROUP BY surname,name, semestr;

SELECT univ_name, subj_name
	FROM university uv, subject sb, subj_lect sl, lecturer lc
	WHERE uv.univ_id = lc.univ_id AND
		  lc.lecturer_id = sl.lecturer_id AND
		  sl.subj_id = sb.subj_id;

SELECT univ_name, semestr, SUM(hour)
	FROM university uv,subject sb
	GROUP BY univ_name, semestr;