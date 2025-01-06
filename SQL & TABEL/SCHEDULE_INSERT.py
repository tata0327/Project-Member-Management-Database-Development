import pymysql
import pandas as pd
# password 부분에는 MySQL Workbench 패스워드를 입력하면 된다.
conn = pymysql.connect(host='127.0.0.1', user='root', password='1234', db='mydb', charset='utf8')
try:
    # CSV 파일 읽기
    csv_file_path = 'SCHEDULE.csv'
    df = pd.read_csv(csv_file_path)

    with conn.cursor() as cursor:
        # 테이블 이름
        table_name = 'SCHEDULE'

        # 데이터프레임을 MySQL에 적재
        df.to_sql(name=table_name, con=conn, if_exists='replace', index=False)

    print(f"CSV 파일이 {table_name} 테이블에 적재되었습니다.")
finally:
    conn.close()
