SELECT sb.subj_name, st.surname, st.kurs, sb.semestr
	FROM student st JOIN subject sb
	ON sb.semestr = st.kurs*2 - 1 OR sb.semestr = st.kurs*2;

SELECT DISTINCT st.surname, st.name
	FROM student st JOIN exams ex
	ON ex.mark IN(3,4,5) AND st.stud_id = ex.stud_id;
