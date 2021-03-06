/*
	建表
*/
CREATE TABLE dev(
	deviceID char(255) primary key,
	American char(255) not null,
	Italian char(255) not null,
	Latte char(255) not null,
	Cabo char(255) not null,
	Milk char(255) not null,
	Water char(255) not null,
	create_time datetime DEFAULT CURRENT_TIMESTAMP,
	update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*
	插入数据
*/
INSERT INTO dev VALUES 
('00015','11','0','30','22','40','33','2020-08-31 15:54:58','2020-08-31 15:54:58'),
('00016','15','22','0','0','55','60','2020-08-31 15:54:37','2020-08-31 15:54:37'),
('00017','22','22','33','1','45','50','2020-08-31 15:54:21','2020-08-31 15:54:21'),
('00018','0','0','0','5','5','5','2020-08-31 15:54:03','2020-08-31 15:54:03'),
('00019','3','13','22','11','30','36','2020-08-31 15:53:26','2020-08-31 15:53:26'),
('00020','9','31','31','1','11','15','2020-08-31 15:42:28','2020-08-31 15:48:39'),
('00021','3','19','22','11','0','0','2020-08-31 15:43:11','2020-08-31 15:43:11'),
('00022','10','0','3','21','0','15','2020-08-31 15:43:59','2020-08-31 15:47:47'),
('00023','0','0','13','17','31','0','2020-08-31 15:44:36','2020-08-31 15:44:36'),
('00024','7','0','0','25','16','17','2020-08-31 15:44:56','2020-08-31 15:44:56'),
('00025','0','9','0','15','20','30','2020-08-31 15:55:26','2020-08-31 15:55:26');

/*
	备份数据库
*/
/*
	mysqldump -uroot -p coffee > a.sql
*/



/*
	查询机器编号为00022的机器的数据
*/
select * from dev where deviceID = '00022';
/*
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
| deviceID | American | Italian | Latte | Cabo | Milk | Water | create_time         | update_time         |
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
| 00022    | 10       | 0       | 3     | 21   | 0    | 15    | 2020-08-31 15:43:59 | 2020-08-31 15:47:47 |
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
*/

/*
	增加数据
*/

update dev set American = '17', Cabo = '21', Water = '15' where deviceID = '00022';
update dev set American = '9', Italian = '31' ,Cabo = '1', Water = '15' where deviceID = '00020';
update dev set Italian = '17', Cabo = '11', Water = '25', Milk = '30' where deviceID = '00018';
/*
	分页查询，取最后更新的五条数据
*/
select * from dev order by update_time desc limit 0,5;
/*
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
| deviceID | American | Italian | Latte | Cabo | Milk | Water | create_time         | update_time         |
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
| 00018    | 0        | 17      | 0     | 11   | 30   | 25    | 2020-08-31 15:54:03 | 2020-08-31 16:01:04 |
| 00022    | 17       | 0       | 3     | 21   | 0    | 15    | 2020-08-31 15:43:59 | 2020-08-31 16:00:18 |
| 00025    | 0        | 9       | 0     | 15   | 20   | 30    | 2020-08-31 15:55:26 | 2020-08-31 15:55:26 |
| 00015    | 11       | 0       | 30    | 22   | 40   | 33    | 2020-08-31 15:54:58 | 2020-08-31 15:54:58 |
| 00016    | 15       | 22      | 0     | 0    | 55   | 60    | 2020-08-31 15:54:37 | 2020-08-31 15:54:37 |
+----------+----------+---------+-------+------+------+-------+---------------------+---------------------+
*/









