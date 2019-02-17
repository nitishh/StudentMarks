DROP PROCEDURE IF EXISTS result;
DELIMITER //
	CREATE PROCEDURE result
	(
		IN batch CHAR(20)
	)
	BEGIN
		SET @zzbatch = batch;
		SET @where_clause = NULL;
		
		CASE WHEN @zzbatch = '' THEN SET @where_clause = '';
		ELSE SET @where_clause = CONCAT('WHERE Batch = ''',@zzbatch, '''');
		END CASE;
		
		SET @SQL = NULL;
		SET @zzSQL = NULL;
		SELECT GROUP_CONCAT(DISTINCT CONCAT('SUM(CASE WHEN sj.name = ''', sj.name, ''' THEN m.marks ELSE NULL END) AS ', REPLACE(sj.name, ' ', '')))
		INTO @SQL
		FROM SUBJECT sj;

		SET @zzSQL = CONCAT('SELECT * FROM
				(SELECT s.name as StudentName
				, s.batch as Batch
				, s.email as Email
					, s.roll as RollNo
					, a.*
				FROM (
				SELECT m.st_id, ', @SQL, '
				FROM SUBJECT sj
				INNER JOIN marksheet m
				ON sj.id = m.sj_id
				GROUP BY m.st_id) a
				INNER JOIN student s 
				ON a.st_id = s.id
				) b INNER JOIN (
				SELECT SUM(m.marks) AS total_mark_obtained
					, SUM(s.total_mark) AS total_mark
					, SUM(m.marks)/SUM(s.total_mark)*100 AS percentage
					, m.st_id
				FROM marksheet m
				INNER JOIN SUBJECT s
				ON m.sj_id = s.id
				GROUP BY m.st_id
				) c
				ON b.st_id = c.st_id ',
				@where_clause
				,' ORDER BY b.st_id');

		PREPARE stmt FROM @zzSQL;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
END //
DELIMITER ;



CALL result('2017');
