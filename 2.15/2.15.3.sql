SELECT surname, subj_id
	FROM student st, exams ex
	WHERE st.stud_id=ex.stud_id;

SELECT surname, subj_id
	FROM student st LEFT OUTER JOIN exams ex
	ON st.stud_id = ex.stud_id;

SELECT surname, subj_name
	FROM student st, subject sb, exams ex
	WHERE st.stud_id = ex.stud_id AND sb.subj_id = ex.subj_id;

SELECT surname, subj_name
	FROM student st LEFT OUTER JOIN exams ex
	ON st.stud_id = ex.stud_id
	LEFT OUTER JOIN subject sb
	ON sb.subj_id = ex.subj_id;

SELECT subj_name, surname, mark
	FROM subject sb, student st, exams ex
	WHERE ex.stud_id = st.stud_id AND sb.subj_id = ex.subj_id AND mark >= 4;
