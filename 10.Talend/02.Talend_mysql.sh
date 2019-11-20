# install mysql & workbench
sudo apt install mysql-server mysql-workbench


# change pw in quotes
sudo mysql -u root
mysql>  USE mysql;
Database changed
mysql> SELECT User, plugin FROM mysql.user;
+------------------+-----------------------+
| User             | plugin                |
+------------------+-----------------------+
| root             | auth_socket           |
| mysql.session    | mysql_native_password |
| mysql.sys        | mysql_native_password |
| debian-sys-maint | mysql_native_password |
+------------------+-----------------------+
4 rows in set (0.00 sec)

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
Query OK, 0 rows affected (0.00 sec)



# create a new connection in the workbench using + the pw has now to be entered
fitec@fitec-ThinkPad-P52s:~/Talend$ mysql-workbench




