SELECT DISTINCT subj_name
	FROM subject sb1
	WHERE sb1.semestr <>ANY (
		SELECT semestr
		FROM subject sb2
		WHERE sb1.subj_name = sb2.subj_name
	);

SELECT surname, name
	FROM student st
	WHERE 3 <=ALL (SELECT mark FROM exams ex1 WHERE ex1.stud_id = st.stud_id) AND
		  5 >=ALL (SELECT mark FROM exams ex1 WHERE ex1.stud_id = st.stud_id) AND
		  EXISTS(SELECT * FROM exams ex1 WHERE ex1.stud_id = st.stud_id);


SELECT DISTINCT stud_id
	FROM exams ex1
	WHERE mark =ANY (SELECT mark
						FROM exams ex2
						WHERE ex2.stud_id=12);

SELECT COUNT(*)
	FROM student
	WHERE stud_id <>ALL (SELECT stud_id FROM exams);

SELECT *
	FROM subject sb
	WHERE EXISTS(SELECT *
					FROM subj_lect sl
					WHERE sb.subj_id = sl.subj_id AND sl.lecturer_id=( 
						SELECT lecturer_id
							FROM lecturer
							WHERE surname='КОЛЕСНИКОВ'
					));
	
