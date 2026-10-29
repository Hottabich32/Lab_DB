SELECT univ_name
	FROM university uv1
	WHERE 1 >
		(SELECT COUNT(*)
			FROM university uv2
			WHERE uv2.univ_id = 1
				  AND uv1.rating >= uv2.rating);

SELECT *
	FROM student st1
	WHERE st1.city != ALL (SELECT city
								FROM university uv);

SELECT subj_name
	FROM subject sb
	WHERE 0 < (
        SELECT COUNT(*)
        FROM exams ex1
        WHERE ex1.subj_id = sb.subj_id
      )
  	AND 0 = (
        SELECT COUNT(*)
        FROM exams ex1
        WHERE ex1.subj_id = sb.subj_id
          AND ex1.mark <= (
              SELECT MAX(mark)
              FROM exams
              WHERE subj_id = 105
          ));
