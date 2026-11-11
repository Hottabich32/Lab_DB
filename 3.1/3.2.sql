INSERT INTO student1
	SELECT *
	FROM student st
	WHERE 5 < (SELECT COUNT(subj_id)
					FROM exams ex
					WHERE ex.stud_id = st.stud_id AND mark>2);

DELETE FROM subject1 sb
	WHERE 0 = (
		SELECT COUNT(mark)
		FROM exams ex
		WHERE ex.subj_id = sb.subj_id
	);

UPDATE student st
	SET stipend = stipend * 1.2
	WHERE mark IS NOT NULL AND 50 <(
		SELECT SUM(mark)
		FROM exams ex
		WHERE ex.stud_id = st.stud_id
	);