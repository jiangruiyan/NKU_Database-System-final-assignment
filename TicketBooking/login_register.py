# 虚拟环境需要配置
import os
os.environ['TCL_LIBRARY'] = r'E:\Python\tcl\tcl8.6'

import pymysql
import ticket

import tkinter as tk
from tkinter import messagebox

# 是否进入主窗口
if_enter = False

username = None

# 连接数据库
def connect_db():
    return pymysql.connect(
        host='localhost',
        user='root',
        password='crRW19K553900',
        database='ticket_booking'
    )

# 创建登录界面
def open_login_window():
    global entry_user, entry_pwd, login_window

    login_window = tk.Toplevel()
    login_window.title("登录界面")
    login_window.geometry("400x150")
    login_window.resizable(False, False)

    # 用户名
    label_user = tk.Label(login_window, text="用户名")
    label_user.grid(row=0, column=0, padx=10, pady=10, sticky="e")

    entry_user = tk.Entry(login_window)
    entry_user.grid(row=0, column=1, padx=10, pady=10)

    # 密码
    label_pwd = tk.Label(login_window, text="密码")
    label_pwd.grid(row=1, column=0, padx=10, pady=10, sticky="e")

    entry_pwd = tk.Entry(login_window, show="*")
    entry_pwd.grid(row=1, column=1, padx=10, pady=10)

    # 注册按钮
    register_button = tk.Button(login_window, text="注册", width=10, command=open_register_window)
    register_button.grid(row=2, column=0, padx=10, pady=10)

    # 登录按钮
    login_button = tk.Button(login_window, text="登录", width=10, command=login)
    login_button.grid(row=2, column=1, padx=10, pady=10)

    # 修改密码按钮
    updatePwd_button = tk.Button(login_window, text="修改密码", width=10, command=open_update_password_window)
    updatePwd_button.grid(row=2, column=2, padx=10, pady=10)

# 登录功能
def login():
    username = entry_user.get()
    password = entry_pwd.get()

    # 重要连接变量！修改ticket中显示的用户
    ticket.username = username

    # 连接到 MySQL 数据库
    try:
        cursor = connect_db().cursor()

        # 执行 SQL 查询，验证用户名和密码
        query = "SELECT * FROM passenger WHERE user_name = %s AND password = %s"
        cursor.execute(query, (username, password))

        # 获取查询结果
        result = cursor.fetchone()
        # print(result)
        if result:  # 如果找到匹配的记录
            messagebox.showinfo("登录成功", "您好，" + result[2])  # result[2] 是 passenger_name
            login_window.withdraw()
            ticket.show_main_window()
        else:
            messagebox.showerror("登录失败", "用户名或密码错误")

        cursor.close()
        connect_db().close()

    except Exception as err:
        messagebox.showerror("数据库连接失败", f"错误：{err}")

# 注册功能
def register_user():
    username = entry_user.get()
    password = entry_pwd.get()
    confirm_pwd = entry_confirm_pwd.get()
    real_name = entry_real_name.get()
    id_card = entry_id_card.get()
    phone = entry_phone.get()

    # 检查每个字段是否为空
    if not username:
        messagebox.showerror("错误", "请输入用户名！")
        return
    if not password:
        messagebox.showerror("错误", "请输入密码！")
        return
    if not confirm_pwd:
        messagebox.showerror("错误", "请输入确认密码！")
        return
    if not real_name:
        messagebox.showerror("错误", "请输入真实姓名！")
        return
    if not id_card:
        messagebox.showerror("错误", "请输入身份证号！")
        return
    if not phone:
        messagebox.showerror("错误", "请输入手机号！")
        return

    # 确认密码是否一致
    if password != confirm_pwd:
        messagebox.showerror("错误", "密码输入不一致！")
        return

    # 插入用户信息到数据库
    try:
        connection = connect_db()
        cursor = connection.cursor()

        # 插入数据的 SQL 语句
        sql = "INSERT INTO passenger (user_name, password, passenger_name, id_card, phone) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (username, password, real_name, id_card, phone))
        connection.commit()
        cursor.close()
        connection.close()

        # 注册成功
        messagebox.showinfo("提示", "注册成功！")
        new_window.destroy()  # 关闭注册界面

    except Exception as e:
        messagebox.showerror("错误", f"注册失败：{e}")

    cursor = connect_db().cursor()
    cursor.close()
    connect_db().close()

# 修改密码功能
def update_password():
    username = entry_user1.get()
    prevoiusPassword = entry_previous_pwd.get()
    newPassword = entry_new_pwd.get()
    confirm_newPassword = entry_confirm_new_pwd.get()

    # 检查每个字段是否为空
    if not username:
        messagebox.showerror("错误", "请输入用户名！")
        return
    if not prevoiusPassword:
        messagebox.showerror("错误", "请输入原密码！")
        return
    if not newPassword:
        messagebox.showerror("错误", "请输入新密码！")
        return
    if not confirm_newPassword:
        messagebox.showerror("错误", "请再次确认新密码！")
        return

    # 确认密码是否一致
    if newPassword != confirm_newPassword:
        messagebox.showerror("错误", "密码输入不一致！")
        return

    # 插入用户信息到数据库
    try:
        connection = connect_db()
        cursor = connection.cursor()

        # 执行 SQL 查询，验证用户名和密码
        query = "SELECT * FROM passenger WHERE user_name = %s AND password = %s"
        cursor.execute(query, (username, prevoiusPassword))

        # 获取查询结果
        result = cursor.fetchone()
        if result:  # 如果找到匹配的记录
            # 插入数据的 SQL 语句
            sql = "CALL updatePassword(%s, %s)"
            cursor.execute(sql, (newPassword, username))
            connection.commit()
            cursor.close()
            connection.close()

            # 修改密码成功
            messagebox.showinfo("提示", "修改密码成功！")
            new_window1.destroy()  # 关闭修改密码界面
        else:
            messagebox.showerror("登录失败", "用户名或密码错误")

    except Exception as e:
        messagebox.showerror("错误", f"修改失败：{e}")

    cursor = connect_db().cursor()
    cursor.close()
    connect_db().close()


# 创建注册界面
def open_register_window():
    global new_window, entry_user, entry_pwd, entry_confirm_pwd, entry_real_name, entry_id_card, entry_phone

    new_window = tk.Toplevel()
    new_window.title("注册新用户")
    new_window.geometry("400x250")
    new_window.resizable(False, False)

    # 设置一个网格布局
    for i in range(7):
        new_window.rowconfigure(i, pad=5)
    new_window.columnconfigure(0, weight=1, pad=10)
    new_window.columnconfigure(1, weight=3, pad=10)

    # 字段标签和输入框
    tk.Label(new_window, text="用户名：").grid(row=0, column=0, sticky="e")
    entry_user = tk.Entry(new_window)
    entry_user.grid(row=0, column=1)

    tk.Label(new_window, text="真实姓名：").grid(row=1, column=0, sticky="e")
    entry_real_name = tk.Entry(new_window)
    entry_real_name.grid(row=1, column=1)

    tk.Label(new_window, text="身份证号：").grid(row=2, column=0, sticky="e")
    entry_id_card = tk.Entry(new_window)
    entry_id_card.grid(row=2, column=1)

    tk.Label(new_window, text="手机号：").grid(row=3, column=0, sticky="e")
    entry_phone = tk.Entry(new_window)
    entry_phone.grid(row=3, column=1)

    tk.Label(new_window, text="密码：").grid(row=4, column=0, sticky="e")
    entry_pwd = tk.Entry(new_window, show="*")
    entry_pwd.grid(row=4, column=1)

    tk.Label(new_window, text="请再次确认密码：").grid(row=5, column=0, sticky="e")
    entry_confirm_pwd = tk.Entry(new_window, show="*")
    entry_confirm_pwd.grid(row=5, column=1)

    # 按钮行
    register_button = tk.Button(new_window, text="注册", command=register_user, width=10)
    register_button.grid(row=6, column=0, pady=15)

    close_button = tk.Button(new_window, text="关闭", command=new_window.destroy, width=10)
    close_button.grid(row=6, column=1)

    new_window.mainloop()

# 创建修改密码界面
def open_update_password_window():
    global new_window1, entry_user1, entry_previous_pwd, entry_new_pwd, entry_confirm_new_pwd

    new_window1 = tk.Toplevel()
    new_window1.title("修改密码")
    new_window1.geometry("400x200")
    new_window1.resizable(False, False)

    # 设置一个网格布局
    for i in range(5):
        new_window1.rowconfigure(i, pad=5)
    new_window1.columnconfigure(0, weight=1, pad=10)
    new_window1.columnconfigure(1, weight=3, pad=10)

    # 字段标签和输入框
    tk.Label(new_window1, text="用户名：").grid(row=0, column=0, sticky="e")
    entry_user1 = tk.Entry(new_window1)
    entry_user1.grid(row=0, column=1)

    tk.Label(new_window1, text="原密码：").grid(row=3, column=0, sticky="e")
    entry_previous_pwd = tk.Entry(new_window1)
    entry_previous_pwd.grid(row=3, column=1)

    tk.Label(new_window1, text="新密码：").grid(row=4, column=0, sticky="e")
    entry_new_pwd = tk.Entry(new_window1, show="*")
    entry_new_pwd.grid(row=4, column=1)

    tk.Label(new_window1, text="请再次确认新密码：").grid(row=5, column=0, sticky="e")
    entry_confirm_new_pwd = tk.Entry(new_window1, show="*")
    entry_confirm_new_pwd.grid(row=5, column=1)

    # 按钮行
    register_button = tk.Button(new_window1, text="修改密码", command=update_password, width=10)
    register_button.grid(row=6, column=0, pady=15)

    close_button = tk.Button(new_window1, text="关闭", command=new_window1.destroy, width=10)
    close_button.grid(row=6, column=1)

    new_window1.mainloop()