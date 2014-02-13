CREATE OR REPLACE FUNCTION SY.NFEI_ASST_DIV_NAME (
	P_ASST_NO	IN	SY.NEIE02M00.ASST_NO%TYPE
)
RETURN VARCHAR2 DETERMINISTIC
IS
/*
 | 자산의 분류명을 반환한다.
*/
	LS_DIV_NAME		VARCHAR2(100);
BEGIN
	SELECT	A.CODE_NM || '-' || B.CODE_NM || '-' || C.CODE_NM
	INTO	LS_DIV_NAME
	FROM	SY.NEIE01M00 A 
			, SY.NEIE01M10 B
			, SY.NEIE01M20 C
	WHERE	A.ASST_LDIV_CD = SUBSTR(P_ASST_NO, 1, 1)
	AND		B.ASST_MDIV_CD = SUBSTR(P_ASST_NO, 2, 2)
	AND		B.ASST_LDIV_CD = A.ASST_LDIV_CD
	AND		C.ASST_SDIV_CD = SUBSTR(P_ASST_NO, 4, 2)
	AND		C.ASST_LDIV_CD = B.ASST_LDIV_CD
	AND		C.ASST_MDIV_CD = B.ASST_MDIV_CD
	;

	RETURN LS_DIV_NAME
	;

END NFEI_ASST_DIV_NAME;
/
GRANT EXECUTE ON SY.NFEI_ASST_DIV_NAME TO CJ,CJC,CJD,CJE,CJS,CJX,CJX_S;
SHOW ERROR;