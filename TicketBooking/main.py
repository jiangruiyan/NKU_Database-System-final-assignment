# 虚拟环境需要配置
import os
os.environ['TCL_LIBRARY'] = r'E:\Python\tcl\tcl8.6'

# import pymysql
#
# import tkinter as tk
# from tkinter import messagebox

import login_register
import ticket

ticket.open_main_window()
login_register.open_login_window()

ticket.window.mainloop()

