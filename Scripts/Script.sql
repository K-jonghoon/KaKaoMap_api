CREATE TABLE VET_HOSPITAL(
	VET_NUM NUMBER
);
ALTER TABLE KJH.VET_HOSPITAL MODIFY 소재지전체주소 VARCHAR2(100);
ALTER TABLE KJH.VET_HOSPITAL MODIFY 도로명전체주소 VARCHAR2(150);

SELECT * FROM VET_HOSPITAL vh WHERE 번호 BETWEEN 1 AND 10;

SELECT 시군명, 사업장명, 인허가일자, 인허가취소일자, 영업상태구분코드, 영업상태명, 폐업일자, 소재지시설전화번호, 도로명우편번호, 소재지도로명주소, 소재지지번주소, 소재지우편번호, WGS84위도, WGS84경도, 업태구분명정보, 축산업무구분명
	FROM 동물병원현황
	WHERE 영업상태명 IN ('운영중','정상') AND 시군명 = '김포시';
	
SELECT 도로명전체주소 
	FROM 동물병원
	WHERE 영업상태구분코드 = '1'	
		AND 도로명전체주소 LIKE '%미추홀구%';
	
SELECT SUBSTR(도로명전체주소, 1, INSTR(도로명전체주소, '(')-1) AS 도로명전체주소
	FROM 동물병원
	WHERE 영업상태구분코드 = '1'	
		AND 도로명전체주소 LIKE '%미추홀구%';
	
SELECT 
	CASE 
		WHEN INSTR(도로명전체주소, ',') > 0 OR INSTR(도로명전체주소, '(') > 0
		THEN SUBSTR(도로명전체주소, 1, INSTR(도로명전체주소, ',')-1)
		ELSE SUBSTR(도로명전체주소, 1, INSTR(도로명전체주소, '(')-1)
	END AS 도로명전체주소
FROM 동물병원
WHERE 영업상태구분코드 = '1'	
		AND 도로명전체주소 LIKE '%미추홀구%';
	
SELECT 
		REGEXP_REPLACE(도로명전체주소, '(\([^)]*\)|,.*$)', '') AS 도로명전체주소
FROM 동물병원
WHERE 영업상태구분코드 = '1'	
		AND 도로명전체주소 LIKE '%미추홀구%';
	
SELECT 번호 , 개방서비스명 , 영업상태명 , 소재지전화 , 소재지전체주소 , 도로명전체주소 , 도로명우편번호 , 사업장명
	FROM 동물병원
	WHERE 영업상태구분코드 = '1'
		AND 소재지전체주소 LIKE '%미추홀구 용현동 146-275%';
	
SELECT 번호 , 개방서비스명 , 영업상태명 , 소재지전화 , 소재지전체주소 , 도로명전체주소 , 도로명우편번호 , 사업장명
			FROM 동물병원
			WHERE 영업상태구분코드 = '1'
				AND 소재지전체주소 LIKE '%금천구%';

SELECT 소재지전체주소, 사업장명
			FROM 동물병원
			WHERE 영업상태구분코드 = '1'
				AND 소재지전체주소 LIKE '%금천구%';
	