SELECT *
	FROM exams ex
	WHERE ex.stud_id = (SELECT stud_id
                    		FROM student st
                    		WHERE st.surname = 'Иванов');

SELECT st.stud_id, st.name
	FROM student st, exams ex
	WHERE st.stud_id = ex.stud_id AND ex.subj_id = 101
	GROUP BY st.stud_id, st.name
		HAVING MAX(ex.mark) > (SELECT AVG(MARK) FROM exams);

SELECT stud_id,COUNT(subj_id)
	FROM exams
	GROUP BY stud_id
		HAVING COUNT(DISTINCT subj_id) > 20;

SELECT stud_id, name
	FROM student st1
	WHERE st1.stipend = (SELECT MAX(stipend)
							FROM student st2
							WHERE st1.city = st2.city);

SELECT stud_id, name
	FROM student
	WHERE city NOT IN(SELECT city FROM university);




