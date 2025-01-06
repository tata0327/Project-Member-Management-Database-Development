import tkinter as tk
from tkinter import ttk
import pymysql

def add_assignment(subjectID, assignment_name, assignment_duedate, assignment_duetime):
    try:
        # MySQL 연결
        connection = pymysql.connect(host='127.0.0.1', user='root', password='1234', db='mydb', charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)

        # SQL 쿼리 수행 예제
        with connection.cursor() as cursor:
            # 여기에 SQL 쿼리를 작성합니다.
            sql_query = f'''
                        INSERT INTO ASSIGNMENT(SUBJECT_Subject_ID, Assignment_Name, Assignment_DueDate, Assignment_DueTime)
                        VALUES('{subjectID}', '{assignment_name}', '{assignment_duedate}', '{assignment_duetime}')
                        '''
            cursor.execute(sql_query)

            # 변경사항을 커밋
            connection.commit()

    finally:
        # 연결 종료
        connection.close()

def submit_button_clicked():
    subject_id = subject_id_entry.get()
    assignment_name = assignment_name_entry.get()
    assignment_due_date = assignment_due_date_entry.get()
    assignment_due_time = assignment_due_time_entry.get()
    add_assignment(subject_id, assignment_name, assignment_due_date, assignment_due_time)

    # 여기에 성공적으로 데이터를 추가한 후의 동작을 추가할 수 있습니다.
    result_label.config(text="Assignment added successfully!")

# UI 생성
root = tk.Tk()
root.title("Add Assignment")

# Subject ID 입력 필드
subject_id_label = ttk.Label(root, text="Subject ID:")
subject_id_label.grid(row=0, column=0, padx=10, pady=10)
subject_id_entry = ttk.Entry(root)
subject_id_entry.grid(row=0, column=1, padx=10, pady=10)

# Assignment 이름 입력 필드
assignment_name_label = ttk.Label(root, text="Assignment Name:")
assignment_name_label.grid(row=1, column=0, padx=10, pady=10)
assignment_name_entry = ttk.Entry(root)
assignment_name_entry.grid(row=1, column=1, padx=10, pady=10)

# Assignment 마감일 입력 필드
assignment_due_date_label = ttk.Label(root, text="Assignment Due Date(YYYY-MM-DD):")
assignment_due_date_label.grid(row=2, column=0, padx=10, pady=10)
assignment_due_date_entry = ttk.Entry(root)
assignment_due_date_entry.grid(row=2, column=1, padx=10, pady=10)

# Assignment 마감 시간 입력 필드
assignment_due_time_label = ttk.Label(root, text="Assignment Due Time(HH:MM:SS):")
assignment_due_time_label.grid(row=3, column=0, padx=10, pady=10)
assignment_due_time_entry = ttk.Entry(root)
assignment_due_time_entry.grid(row=3, column=1, padx=10, pady=10)

# 제출 버튼
submit_button = ttk.Button(root, text="Submit", command=submit_button_clicked)
submit_button.grid(row=4, column=0, columnspan=2, pady=10)

# 결과를 표시할 레이블
result_label = ttk.Label(root, text="")
result_label.grid(row=5, column=0, columnspan=2, pady=10)

# GUI 시작
root.mainloop()