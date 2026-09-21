SELECT *
	FROM university
	WHERE city='МОСКВА' AND rating < (SELECT rating 
										FROM university 
										WHERE univ_name='ВОРОНЕЖСКИЙ_ГОСУДАРСТВЕННЫЙ_УНИВЕРСИТЕТ');