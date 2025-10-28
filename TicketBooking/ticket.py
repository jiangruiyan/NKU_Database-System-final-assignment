# 虚拟环境需要配置
import os
os.environ['TCL_LIBRARY'] = r'E:\Python\tcl\tcl8.6'

import pymysql
import random
import string

import tkinter as tk
from tkinter import ttk
from tkinter import messagebox

# 登录的用户名（在login_register中修改）
username = None

# 连接数据库
def connect_db():
    return pymysql.connect(
        host='localhost',
        user='root',
        password='crRW19K553900',
        database='ticket_booking'
    )

# 创建主窗口
def open_main_window():
    global  window
    window = tk.Tk()
    window.title("欢迎乘坐京津城际铁路列车")
    window.geometry("1000x800")
    window.resizable(False, True)
    window.withdraw() # 主窗口暂时隐藏，登录成功再显示

checkbox_vars2 = {}  # 全局变量：用于记录每个车次的选中状态
# 查询车票信息
def search_ticket():
    global tree3, checkbox_vars2

    dep_station=departure_entry.get().strip()
    arr_station=arrival_entry.get().strip()

    checkbox_vars2.clear()  # 清空旧的复选框状态记录

    try:
        conn = connect_db()
        cursor = conn.cursor()

        # SQL查询车票
        query = """
                SELECT
                    train_id,start_station,start_time,end_station,end_time,travel_time,
                    (SELECT num_of_seats
                     FROM (SELECT train_id,COUNT(seat_id) AS num_of_seats FROM inventory NATURAL JOIN seat 
                                 WHERE start_station = %s 
                                     AND end_station = %s 
                                     AND ticket_status = 'available' 
                                     AND seat_type = '二等座' 
                                 GROUP BY train_id 
                            ) AS count_seat 
                    WHERE count_seat.train_id = train_schedule_view.train_id 
                    ) AS ZE,
                        (SELECT num_of_seats
                     FROM (SELECT train_id,COUNT(seat_id) AS num_of_seats FROM inventory NATURAL JOIN seat 
                                 WHERE start_station = %s 
                                     AND end_station = %s 
                                     AND ticket_status = 'available' 
                                     AND seat_type = '一等座' 
                                 GROUP BY train_id 
                            ) AS count_seat 
                    WHERE count_seat.train_id = train_schedule_view.train_id 
                    ) AS ZY,
                        (SELECT num_of_seats
                     FROM (SELECT train_id,COUNT(seat_id) AS num_of_seats FROM inventory NATURAL JOIN seat 
                                 WHERE start_station = %s 
                                     AND end_station = %s 
                                     AND ticket_status = 'available' 
                                     AND seat_type = '商务座' 
                                 GROUP BY train_id 
                            ) AS count_seat 
                    WHERE count_seat.train_id = train_schedule_view.train_id 
                    ) AS SW
                FROM
                    train_schedule_view 
                WHERE
                    start_station = %s 
                    AND end_station = %s 
                ORDER BY
                    start_time ASC;

            """
        cursor.execute(query, (dep_station, arr_station, dep_station, arr_station, dep_station, arr_station, dep_station, arr_station))
        results = cursor.fetchall()

        # 清空表格
        for row in tree3.get_children():
            tree3.delete(row)

        # 插入查询结果
        for row in results:
            train_no, departure_station, d_time, arrival_station, a_time, travel_time, second_class, first_class, business_class = row
            checkbox_vars2[train_no] = tk.BooleanVar(value=False)

            tree3.insert('', 'end', iid=train_no, values=(
                train_no, departure_station, d_time,
                arrival_station, a_time, travel_time, second_class, first_class, business_class,
                "√" if checkbox_vars2[train_no].get() else ""  # 初始为空
            ))

        cursor.close()
        conn.close()
    except Exception as e:
        messagebox.showerror("错误", f"数据库查询失败: {e}")

# 购票功能
def purchase_ticket():

    dep_station=departure_entry.get().strip()
    arr_station=arrival_entry.get().strip()

    if not checkbox_vars2:
        messagebox.showinfo("提示", "暂无可购票信息，请先查询车票")
        return

    # 弹出新窗口用于选择购票
    popup = tk.Toplevel()
    a = 220
    for _ in checkbox_vars2.keys():
        a += 30
    popup.geometry(f"240x{a}")
    popup.resizable(False, True)
    popup.title("购票")

    tk.Label(popup, text="勾选你要购票的车次：").pack(pady=5)

    selected_vars = {}  # 存储新弹窗内每张票的复选框变量

    frame = tk.Frame(popup)
    frame.pack(padx=10, pady=10)

    # 创建复选框
    for train_no in checkbox_vars2.keys():
        var = tk.BooleanVar()
        selected_vars[train_no] = var
        tk.Checkbutton(frame, text=f"车次：{train_no}", variable=var).pack(anchor='w')

    tk.Label(popup, text="勾选你要购票的席别：").pack(pady=5)

    selected_vars1 = {}  # 存储新弹窗内席别的复选框变量

    frame = tk.Frame(popup)
    frame.pack(padx=10, pady=10)

    # 创建复选框
    seatType_vars = ["二等座","一等座","商务座"]
    for seatType in seatType_vars:
        var = tk.BooleanVar()
        selected_vars1[seatType] = var
        tk.Checkbutton(frame, text=f"席别：{seatType}", variable=var).pack(anchor='w')

    def confirm_purchase():
        selected_trains = [tn for tn, var in selected_vars.items() if var.get()]
        if not selected_trains:
            messagebox.showinfo("提示", "请选择一张车票")
            return

        if len(selected_trains) > 1:
            messagebox.showinfo("提示", "每次最多选择一张车票")
            return

        selected_seatType = [tn1 for tn1, var in selected_vars1.items() if var.get()]
        if not selected_seatType:
            messagebox.showinfo("提示", "请选择席别")
            return

        if len(selected_seatType) > 1:
            messagebox.showinfo("提示", "只能选择一个席别")
            return

        if messagebox.askyesno("确认购票", f"是否确认购票以下车次席别？\n{', '.join(selected_trains)}{', '.join(selected_seatType)}"):
            train_no = selected_trains[0]
            seat_type = selected_seatType[0]
            conn = connect_db()
            cursor = conn.cursor()
            queryInventorySQL = """
                                SELECT seat_id
                                FROM inventory NATURAL JOIN seat
                                WHERE train_id = %s AND start_station = %s AND end_station = %s
                                      AND seat_type = %s AND ticket_status = 'available';
                            """
            cursor.execute(queryInventorySQL, (train_no, dep_station, arr_station, seat_type))
            results_seat = cursor.fetchall()
            if len(results_seat) == 0:
                messagebox.showerror("错误", "购票失败: 余票不足！")
                return

            try:
                # 开始事务
                cursor.execute("START TRANSACTION")
                book_seat = results_seat[0][0] # 取出座位号

                # 生成随机订单号
                def generate_random_string(length=8):
                    whetherDuplicate = True
                    chars = "AAAAAAAA"
                    while whetherDuplicate:
                        chars = string.ascii_letters + string.digits  # 包含大小写字母和数字
                        chars = chars.upper()
                        cursor.execute("SELECT * FROM ticket WHERE ticket_id = %s", chars)
                        results = cursor.fetchall()
                        if len(results) == 0:
                            whetherDuplicate = False

                    return ''.join(random.choices(chars, k=length))

                random_str = generate_random_string()

                cursor.execute("SELECT id_card FROM passenger WHERE user_name = %s", username)
                pID = cursor.fetchall()[0][0]

                cursor.execute("INSERT INTO ticket VALUES (%s,%s,%s,%s,%s,%s)",
                               (random_str, pID, train_no, dep_station, arr_station, book_seat))
                messagebox.showinfo("提示", "购票成功")
                conn.commit()  # 成功->事务提交
                popup.destroy()  # 关闭弹窗
                search_ticket()  # 刷新主界面
            except Exception as e:
                conn.rollback()  # 失败->事务回滚
                messagebox.showerror("错误", f"购票失败: {e}")

    # 确认和取消按钮
    tk.Button(popup, text="购票", command=confirm_purchase).pack(side='left', padx=10, pady=10)
    tk.Button(popup, text="取消", command=popup.destroy).pack(side='right', padx=10, pady=10)


# 查询车次信息
def search_schedule():
    train_no = entry_train_no.get().strip()

    if not train_no:
        messagebox.showwarning("提示", "请输入车次号")
        return

    try:
        conn = connect_db()
        cursor = conn.cursor()

        # 示例 SQL，按需修改你的表名和字段
        query = """
                SELECT 
                    train_id, sequence, station,
                    SUBSTRING_INDEX(arrival_time, ':', 2), SUBSTRING_INDEX(departure_time, ':', 2),
                    CONCAT(CAST(TIME_TO_SEC(TIMEDIFF(departure_time, arrival_time)) / 60 AS SIGNED), '分')
                FROM 
                    stopovers
                WHERE 
                    train_id = %s
                ORDER BY 
                    sequence ASC
            """
        cursor.execute(query, (train_no,))
        results = cursor.fetchall()

        # 清空旧表格
        for row in tree.get_children():
            tree.delete(row)

        # 填充新数据
        for row in results:
            tree.insert('', 'end', values=row)

        if not results:
            messagebox.showinfo("结果", "未找到该车次的时刻表信息。")

        cursor.close()
        conn.close()

    except Exception as e:
        messagebox.showerror("错误", f"数据库查询失败: {e}")

# 查询车站信息
def search_station():
    station_name = entry_station_name.get().strip()

    if not station_name:
        messagebox.showwarning("提示", "请输入车站名称")
        return

    try:
        conn = connect_db()
        cursor = conn.cursor()

        # 示例 SQL，按需修改你的表名和字段
        query = """
                SELECT 
                    train_id, station,
                    SUBSTRING_INDEX(arrival_time, ':', 2), SUBSTRING_INDEX(departure_time, ':', 2),
                    departure, destination
                FROM 
                    stopovers NATURAL JOIN train
                WHERE 
                    station = %s
                ORDER BY 
                    arrival_time, departure_time ASC
            """
        cursor.execute(query, (station_name,))
        results = cursor.fetchall()

        # 清空旧表格
        for row in tree1.get_children():
            tree1.delete(row)

        # 填充新数据
        for row in results:
            tree1.insert('', 'end', values=row)

        if not results:
            messagebox.showinfo("结果", "未找到该车站的信息。")

        cursor.close()
        conn.close()

    except Exception as e:
        messagebox.showerror("错误", f"数据库查询失败: {e}")



checkbox_vars = {}  # 全局变量：用于记录每个订单号的选中状态

# 查询用户车票信息
def search_user_ticket():
    global username, checkbox_vars
    checkbox_vars.clear()  # 清空旧的复选框状态记录

    try:
        conn = connect_db()
        cursor = conn.cursor()

        query = """
                SELECT DISTINCT
                    t1.ticket_id, t1.train_id,
                    t1.departure_station, SUBSTRING_INDEX(s1.departure_time, ':', 2) AS d_time,
                    t1.arrival_station, SUBSTRING_INDEX(s2.arrival_time, ':', 2) AS a_time,
                     CONCAT(
                            IF(FLOOR(TIME_TO_SEC(TIMEDIFF(s2.arrival_time, s1.departure_time)) / 3600) > 0,
                                 CONCAT(FLOOR(TIME_TO_SEC(TIMEDIFF(s2.arrival_time, s1.departure_time)) / 3600), '小时'),
                                 ''
                            ),
                            IF(MOD(FLOOR(TIME_TO_SEC(TIMEDIFF(s2.arrival_time, s1.departure_time)) / 60), 60) > 0,
                                 CONCAT(MOD(FLOOR(TIME_TO_SEC(TIMEDIFF(s2.arrival_time, s1.departure_time)) / 60), 60), '分'),
                                 ''
                            )
                        ) AS travel_time,
                    s3.seat_type, t1.seat_id
                FROM 
                    ticket t1
                JOIN 
                    stopovers s1 ON s1.train_id = t1.train_id AND s1.station = t1.departure_station
                JOIN 
                    stopovers s2 ON s2.train_id = t1.train_id AND s2.station = t1.arrival_station
                JOIN 
                    seat s3 ON s3.seat_id = t1.seat_id
                WHERE 
                    t1.passenger_id = (SELECT id_card FROM passenger WHERE user_name = %s)
                ORDER BY 
                    d_time ASC;
            """
        cursor.execute(query, (username,))
        results = cursor.fetchall()

        for row in tree2.get_children():
            tree2.delete(row)

        for row in results:
            ticket_id, train_no, departure_station, d_time, arrival_station, a_time, travel_time, seat_type, seat_id = row
            checkbox_vars[ticket_id] = tk.BooleanVar(value=False)

            tree2.insert('', 'end', iid=ticket_id, values=(
                ticket_id, train_no, departure_station, d_time,
                arrival_station, a_time, travel_time, seat_type, seat_id,
                "√" if checkbox_vars[ticket_id].get() else ""  # 初始为空
            ))

        cursor.close()
        conn.close()
    except Exception as e:
        messagebox.showerror("错误", f"数据库查询失败: {e}")

# 退票功能
def refund_ticket():
    if not checkbox_vars:
        messagebox.showinfo("提示", "暂无可退票信息，请先查询车票")
        return

    # 弹出新窗口用于选择退票
    popup = tk.Toplevel()
    a = 110
    for _ in checkbox_vars.keys():
        a += 30
    popup.geometry(f"240x{a}")
    popup.resizable(False, True)
    popup.title("退票")

    tk.Label(popup, text="勾选你要退票的订单号：").pack(pady=5)

    selected_vars = {}  # 存储新弹窗内每张票的复选框变量

    frame = tk.Frame(popup)
    frame.pack(padx=10, pady=10)

    # 创建复选框
    for ticket_id in checkbox_vars.keys():
        var = tk.BooleanVar()
        selected_vars[ticket_id] = var
        tk.Checkbutton(frame, text=f"订单号：{ticket_id}", variable=var).pack(anchor='w')

    def confirm_refund():
        selected_tickets = [tid for tid, var in selected_vars.items() if var.get()]
        if not selected_tickets:
            messagebox.showinfo("提示", "请选择一张车票")
            return

        if len(selected_tickets) > 1:
            messagebox.showinfo("提示", "每次最多选择一张车票")
            return

        if messagebox.askyesno("确认退票", f"是否确认退票以下订单？\n{', '.join(selected_tickets)}"):
            conn = connect_db()
            cursor = conn.cursor()
            try:
                # 开始事务
                cursor.execute("START TRANSACTION")
                tid = selected_tickets[0]
                updateRefundSQL = """
                                 UPDATE 
                                    inventory
                                SET 
                                    ticket_status = 'available'
                                WHERE 
                                    train_id = (SELECT train_id FROM ticket WHERE ticket_id = %s)
	                            AND 
	                                seat_id = (SELECT seat_id FROM ticket WHERE ticket_id = %s)
	                            AND 
	                                (SELECT sequence FROM stopovers WHERE station = start_station 
	                                    AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = %s)) >= 
                                    (SELECT sequence FROM stopovers WHERE station = (SELECT departure_station FROM ticket WHERE ticket_id = %s) 
                                        AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = %s))
	                            AND 
	                                (SELECT sequence FROM stopovers WHERE station = end_station 
	                                    AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = %s)) <= 
                                    (SELECT sequence FROM stopovers WHERE station = (SELECT arrival_station FROM ticket WHERE ticket_id = %s) 
                                        AND train_id = (SELECT train_id FROM ticket WHERE ticket_id = %s));
                            """
                cursor.execute(updateRefundSQL, (tid, tid, tid, tid, tid, tid, tid, tid))
                cursor.execute("DELETE FROM ticket WHERE ticket_id = %s", (tid,))
                messagebox.showinfo("提示", "退票成功")
                conn.commit() # 成功->事务提交
                popup.destroy()  # 关闭弹窗
                search_user_ticket()  # 刷新主界面
            except Exception as e:
                conn.rollback() # 失败->事务回滚
                messagebox.showerror("错误", f"退票失败: {e}")

    # 确认和取消按钮
    tk.Button(popup, text="退票", command=confirm_refund).pack(side='left', padx=10, pady=10)
    tk.Button(popup, text="取消", command=popup.destroy).pack(side='right', padx=10, pady=10)


# 设置标签页tab1
def create_tab1_interface(tab1):
    global username, tree3, departure_entry, arrival_entry
    # cursor = connect_db().cursor()

    # 输入发站和到站
    frame_input = tk.Frame(tab1)
    frame_input.grid(row=0, column=0, columnspan=5, padx=10, pady=10, sticky="ew")

    departure_label = tk.Label(frame_input, text="发站:")
    departure_label.grid(row=0, column=0, padx=10, pady=10, sticky="e")
    departure_entry = tk.Entry(frame_input)
    departure_entry.grid(row=0, column=1, padx=10, pady=10)

    arrival_label = tk.Label(frame_input, text="到站:")
    arrival_label.grid(row=0, column=2, padx=10, pady=10, sticky="e")
    arrival_entry = tk.Entry(frame_input)
    arrival_entry.grid(row=0, column=3, padx=10, pady=10)

    # 查询按钮
    query_button = tk.Button(frame_input, text="查询", command=search_ticket)
    query_button.grid(row=0, column=4, padx=10, pady=10)

    # 允许自动扩展
    tab1.grid_columnconfigure(0, weight=1)

    # 表格区域
    columns = ("train_no", "departure_station", "depart_time", "arrival_station", "arrive_time", "travel_time", "ZE", "ZY", "SW")
    tree3 = ttk.Treeview(tab1, columns=columns, show='headings', height=10)

    # 设置列标题
    tree3.heading("train_no", text="车次")
    tree3.heading("departure_station", text="发站")
    tree3.heading("depart_time", text="出发时间")
    tree3.heading("arrival_station", text="到站")
    tree3.heading("arrive_time", text="到达时间")
    tree3.heading("travel_time", text="历时")
    tree3.heading("ZE", text="二等座")
    tree3.heading("ZY", text="一等座")
    tree3.heading("SW", text="商务座")

    # 设置列宽度
    for col in columns:
        tree3.column(col, width=100, anchor='center')

    tree3.grid(row=1, column=0, columnspan=5, padx=10, pady=10, sticky="nsew")

    # 表格滚动条
    scrollbar = ttk.Scrollbar(tab1, orient="vertical", command=tree3.yview)
    scrollbar.grid(row=1, column=5, sticky='ns')
    tree3.configure(yscroll=scrollbar.set)

    # 购票按钮
    purchase_button = tk.Button(tab1, text="购票", command=purchase_ticket)
    purchase_button.grid(row=2, column=0, columnspan=5, padx=10, pady=10, sticky="w")

    # 允许自动扩展
    tab1.grid_rowconfigure(1, weight=1)
    tab1.grid_columnconfigure(2, weight=1)


# 设置标签页tab2
def create_tab2_interface(tab2):
    global entry_train_no, tree

    # 查询输入区域
    tk.Label(tab2, text="车次:").grid(row=0, column=0, padx=10, pady=10, sticky="e")
    entry_train_no = tk.Entry(tab2, width=20)
    entry_train_no.grid(row=0, column=1, padx=10, pady=10)

    query_button = tk.Button(tab2, text="查询", command=search_schedule)
    query_button.grid(row=0, column=2, padx=10, pady=10)

    # 表格区域
    columns = ("train_no", "station_order", "station_name", "arrive_time", "depart_time", "stop_time")
    tree = ttk.Treeview(tab2, columns=columns, show='headings', height=10)

    # 设置列标题
    tree.heading("train_no", text="车次")
    tree.heading("station_order", text="站序")
    tree.heading("station_name", text="站名")
    tree.heading("arrive_time", text="到达时间")
    tree.heading("depart_time", text="出发时间")
    tree.heading("stop_time", text="停留时间")

    # 设置列宽度（按需调整）
    for col in columns:
        tree.column(col, width=100, anchor='center')

    tree.grid(row=1, column=0, columnspan=3, padx=10, pady=10, sticky="nsew")

    # 表格滚动条
    scrollbar = ttk.Scrollbar(tab2, orient="vertical", command=tree.yview)
    scrollbar.grid(row=1, column=3, sticky='ns')
    tree.configure(yscroll=scrollbar.set)

    # 允许自动扩展
    tab2.grid_rowconfigure(1, weight=1)
    tab2.grid_columnconfigure(2, weight=1)


# 设置标签页tab3
def create_tab3_interface(tab3):
    global entry_station_name, tree1

    # 查询输入区域
    tk.Label(tab3, text="车站:").grid(row=0, column=0, padx=10, pady=10, sticky="e")
    entry_station_name = tk.Entry(tab3, width=20)
    entry_station_name.grid(row=0, column=1, padx=10, pady=10)

    query_button = tk.Button(tab3, text="查询", command=search_station)
    query_button.grid(row=0, column=2, padx=10, pady=10)

    # 表格区域
    columns = ("train_no", "station", "arrive_time", "depart_time", "departure_station", "arrival_station")
    tree1 = ttk.Treeview(tab3, columns=columns, show='headings', height=10)

    # 设置列标题
    tree1.heading("train_no", text="车次")
    tree1.heading("station", text="本站")
    tree1.heading("arrive_time", text="本站到达时间")
    tree1.heading("depart_time", text="本站出发时间")
    tree1.heading("departure_station", text="始发站")
    tree1.heading("arrival_station", text="终到站")

    # 设置列宽度（按需调整）
    for col in columns:
        tree1.column(col, width=100, anchor='center')

    tree1.grid(row=1, column=0, columnspan=3, padx=10, pady=10, sticky="nsew")

    # 表格滚动条
    scrollbar = ttk.Scrollbar(tab3, orient="vertical", command=tree1.yview)
    scrollbar.grid(row=1, column=3, sticky='ns')
    tree1.configure(yscroll=scrollbar.set)

    # 允许自动扩展
    tab3.grid_rowconfigure(1, weight=1)
    tab3.grid_columnconfigure(2, weight=1)


# 设置标签页tab4
def create_tab4_interface(tab4):
    global username, tree2
    cursor = connect_db().cursor()
    cursor.execute("SELECT passenger_name FROM passenger WHERE user_name = %s", (username,))
    name = cursor.fetchone()[0]
    label_text = f"以下显示乘客 {name} 的车票信息："
    label = tk.Label(tab4, text=label_text)
    label.grid(row=0, column=0, padx=10, pady=10, sticky="e")

    query_button = tk.Button(tab4, text="查询", command=search_user_ticket)
    query_button.grid(row=0, column=2, padx=10, pady=10)

    # 表格区域
    columns = ("ticket_no", "train_no", "departure_station", "depart_time", "arrival_station", "arrive_time", "time", "seat_type", "seat_id")
    tree2 = ttk.Treeview(tab4, columns=columns, show='headings', height=10)

    # 设置列标题
    tree2.heading("ticket_no", text="订单号")
    tree2.heading("train_no", text="车次")
    tree2.heading("departure_station", text="发站")
    tree2.heading("depart_time", text="出发时间")
    tree2.heading("arrival_station", text="到站")
    tree2.heading("arrive_time", text="到达时间")
    tree2.heading("time", text="历时")
    tree2.heading("seat_type", text="席别")
    tree2.heading("seat_id", text="席位号")

    # 设置列宽度（按需调整）
    for col in columns:
        tree2.column(col, width=100, anchor='center')

    tree2.grid(row=1, column=0, columnspan=3, padx=10, pady=10, sticky="nsew")

    # 表格滚动条
    scrollbar = ttk.Scrollbar(tab4, orient="vertical", command=tree2.yview)
    scrollbar.grid(row=1, column=3, sticky='ns')
    tree2.configure(yscroll=scrollbar.set)

    # 添加“退票”按钮
    refund_button = tk.Button(tab4, text="退票", command=refund_ticket)
    refund_button.grid(row=2, column=0, padx=10, pady=10, sticky="w")


    # 允许自动扩展
    tab4.grid_rowconfigure(1, weight=1)
    tab4.grid_columnconfigure(2, weight=1)


# 显示主窗口
def show_main_window():
    window.deiconify()

    # 创建 Notebook 控件（选项卡容器）
    notebook = ttk.Notebook(window)
    notebook.pack(fill='both', expand=True)

    # 创建第一个标签页
    tab1 = tk.Frame(notebook)
    notebook.add(tab1, text="购票")

    # 创建第二个标签页
    tab2 = tk.Frame(notebook)
    notebook.add(tab2, text="车次查询")

    # 创建第三个标签页
    tab3 = tk.Frame(notebook)
    notebook.add(tab3, text="车站查询")

    # 创建第四个标签页
    tab4 = tk.Frame(notebook)
    notebook.add(tab4, text="我的车票")

    create_tab1_interface(tab1)
    create_tab2_interface(tab2)
    create_tab3_interface(tab3)
    create_tab4_interface(tab4)
