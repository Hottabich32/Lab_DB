SELECT *
	FROM student st
	WHERE EXISTS(SELECT *
					FROM university uv
					WHERE rating > 300 AND st.univ_id = uv.univ_id);

SELECT *
	FROM student st
	WHERE EXISTS (SELECT *
					FROM university uv
					WHERE st.univ_id != uv.univ_id AND st.city = uv.city);

SELECT subj_name
	FROM subject sb
	WHERE EXISTS(SELECT 1
					FROM exams ex
					WHERE sb.subj_id = ex.subj_id
					GROUP BY ex.subj_id
					HAVING COUNT(ex.stud_id) > 1);

SELECT DISTINCT city
	FROM student st
	WHERE EXISTS(SELECT *
					FROM university uv
					WHERE st.city = uv.city);

SELECT *
	FROM university uv
	WHERE NOT EXISTS(SELECT *
						FROM lecturer lc
						WHERE uv.univ_id = lc.univ_id);



