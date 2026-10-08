SELECT *
	FROM student st
	WHERE st.city=(SELECT city
						FROM university us
						WHERE st.univ_id = us.univ_id);

						
SELECT *
	FROM student st
	WHERE st.city != (SELECT city FROM university us WHERE us.univ_id = st.univ_id)
	ORDER BY st.univ_id, st.kurs;


SELECT *
	FROM lecturer l
	WHERE l.city != (SELECT city FROM university us WHERE l.univ_id = us.univ_id)
	ORDER BY l.univ_id, l.city;


SELECT *
	FROM subject sb1
	WHERE sb1.hour = (
		SELECT MAX(hour)
		FROM subject sb2
		WHERE sb1.semestr = sb2.semestr
	)
	ORDER BY sb1.semestr;


SELECT *
	FROM student st1
	WHERE st1.stipend > (
			SELECT AVG(stipend)
			FROM student st2
			WHERE st1.kurs = st2.kurs
	);




