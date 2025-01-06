import pymysql
# password 부분에는 MySQL Workbench 패스워드를 입력하면 된다.
conn = pymysql.connect(host='127.0.0.1', user='root', password='1234', db='mydb', charset='utf8')
try:
    with conn.cursor() as cursor:

        # 쿼리 작성 (예: 특정 테이블의 특정 열 값 받아오기)
        query = f"SELECT SCHEDULE.Day FROM SCHEDULE WHERE SUBJECT_Subject_ID = 1"

        # 쿼리 실행
        cursor.execute(query)

        # 결과 가져오기
        result = cursor.fetchall()
        free_time_dic = {}

        def free_time(subject):
            subject_free = []
            Start = subject['Start_time']
            End = subject['End_Time']
            if subject['Day'] == 'MON':
                free_time_list = list(range(Start,End))
            elif subject['Day'] == 'TUE':
                free_time_list = list(range(Start+8,End+8))
            elif subject['Day'] == 'WED':
                free_time_list = list(range(Start+16,End+16))
            elif subject['Day'] == 'THU':
                free_time_list = list(range(Start+24,End+24))
            elif subject['Day'] == 'FRI':
                free_time_list = list(range(Start+32,End+32))
            subject_free = subject_free + free_time_list
            return subject_free

        for i in result:
            free_time_dic[i['SUBJECT_Subject_ID']] = free_time_dic[i['SUBJECT_Subject_ID']] + free_time(i)

        print(free_time_dic)











        result['Day']

        if result:

            # 원하는 작업 수행 (이 예제에서는 결과를 출력)
            print(result)
        else:
            print("해당 조건에 맞는 데이터가 없습니다.")
finally:
    conn.close()
