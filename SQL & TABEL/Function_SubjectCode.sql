DELIMITER //

CREATE FUNCTION GetSubjectCode(subjectName VARCHAR(255))
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE subjectID VARCHAR(255);
    DECLARE subjectCode VARCHAR(255);

    # 과목명과 일치하는 Subject_ID 찾기
    SELECT Subject_ID INTO subjectID
    FROM SUBJECT
    WHERE Subject_Name = subjectName;

    # '.' 이전의 문자열(과목 코드) 추출
    SET subjectCode = SUBSTRING_INDEX(subjectID, '.', 1);

    RETURN subjectCode;
END //

DELIMITER ;