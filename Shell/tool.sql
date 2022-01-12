CREATE DEFINER=`root`@`%` PROCEDURE `p_filedcomment`()
BEGIN
	DECLARE
c_tableName VARCHAR ( 1000 );# 声明游标结束变量
	DECLARE
done INT DEFAULT 0;# 声明游标 cr 以及游标读取到结果集最后的处理方式
		DECLARE	my_sqll VARCHAR (1000);
	DECLARE
cr CURSOR FOR SELECT
                  CONCAT(
                          'alter table ',
                          b.TABLE_NAME,
                          ' modify column ',
                          b.COLUMN_NAME,
                          ' ',
                          b.COLUMN_TYPE,
                          ' ',
                          IF( b.IS_NULLABLE = 'YES', ' NULL ', ' NOT NULL ' ),
                          IF(b.COLUMN_DEFAULT is null,' ',CONCAT(' DEFAULT ',b.COLUMN_DEFAULT)),

                          REPLACE(b.EXTRA,'DEFAULT_GENERATED',''),
                          ' comment ',
                          ' "',c.filecoment,'";'
                      ) -- AS sqlstr NOT NULL DEFAULT CURRENT_TIMESTAMP

              FROM
                  information_schema.TABLES a
                      RIGHT JOIN information_schema.COLUMNS b ON a.table_name = b.TABLE_NAME
                      RIGHT JOIN t_coment c ON c.tablename = b.TABLE_NAME and b.COLUMN_NAME=c.filedname
              WHERE
                      a.table_schema = 'coreShop'
                AND b.column_comment = ''
                AND b.TABLE_SCHEMA = 'coreShop';

DECLARE
CONTINUE HANDLER FOR NOT found
		SET done = 1;# 打开游标
	OPEN cr;# 循环
	readLoop :
	LOOP# 获取游标中值并赋值给变量
		FETCH cr INTO c_tableName;# 判断游标是否到底，若到底则退出游标
# 需要注意这个判断
		IF
			done = 1 THEN
				LEAVE readLoop;

END IF;

		-- select c_tableName;

		SET @tableName = c_tableName;
		SET my_sqll =@tableName;
		SET @ms = my_sqll;
		-- select @ms;
PREPARE s1 FROM	@ms;
-- EXECUTE s1 using @tableName,@tableName;
EXECUTE s1;
DEALLOCATE PREPARE s1;

END LOOP readLoop;-- 关闭游标
CLOSE cr;

END


CREATE DEFINER=`root`@`%` PROCEDURE `p_identitypk`()
BEGIN
	DECLARE
c_tableName VARCHAR ( 50 );# 声明游标结束变量
	DECLARE
done INT DEFAULT 0;# 声明游标 cr 以及游标读取到结果集最后的处理方式
		DECLARE	my_sqll VARCHAR (1000);
	DECLARE
cr CURSOR FOR SELECT
                  t.TABLE_NAME
              FROM
                  INFORMATION_SCHEMA.COLUMNS  t
              WHERE
                      TABLE_SCHEMA = 'coreShop'
                AND COLUMN_NAME = 'id'
                AND COLUMN_KEY = 'PRI';
DECLARE
CONTINUE HANDLER FOR NOT found
		SET done = 1;# 打开游标
	OPEN cr;# 循环
	readLoop :
	LOOP# 获取游标中值并赋值给变量
		FETCH cr INTO c_tableName;# 判断游标是否到底，若到底则退出游标
# 需要注意这个判断
		IF
			done = 1 THEN
				LEAVE readLoop;

END IF;

		-- select c_tableName;

		SET @tableName = c_tableName;
		SET my_sqll = CONCAT('ALTER TABLE ',@tableName,' MODIFY COLUMN id INT ( 11 ) NOT NULL AUTO_INCREMENT COMMENT \'自增id\';');-- 'ALTER TABLE ',@tableName,' add primary key (id);' ,'ALTER TABLE ',@tableName,' MODIFY COLUMN id INT ( 11 ) NOT NULL AUTO_INCREMENT COMMENT \'自增id\';'
		SET @ms = my_sqll;
PREPARE s1 FROM	@ms;
-- EXECUTE s1 using @tableName,@tableName;
EXECUTE s1;
DEALLOCATE PREPARE s1;

END LOOP readLoop;-- 关闭游标
CLOSE cr;

END




CREATE DEFINER=`root`@`%` PROCEDURE `p_tablecomment`()
BEGIN
	DECLARE
c_tableName VARCHAR ( 1000 );# 声明游标结束变量
	DECLARE
done INT DEFAULT 0;# 声明游标 cr 以及游标读取到结果集最后的处理方式
		DECLARE	my_sqll VARCHAR (1000);
	DECLARE
cr CURSOR FOR SELECT
                  CONCAT(
                          'alter table ',
                          a.TABLE_NAME,
                          ' comment ',
                          ' "',c.comment,'";'
                      ) -- AS sqlstr alter table 表名 comment '修改后的表的注释';

              FROM
                  information_schema.TABLES a
                      RIGHT JOIN t_tablecoment c ON c.tablename = a.TABLE_NAME
              WHERE
                      a.table_schema = 'coreShop' ;

DECLARE
CONTINUE HANDLER FOR NOT found
		SET done = 1;# 打开游标
	OPEN cr;# 循环
	readLoop :
	LOOP# 获取游标中值并赋值给变量
		FETCH cr INTO c_tableName;# 判断游标是否到底，若到底则退出游标
# 需要注意这个判断
		IF
			done = 1 THEN
				LEAVE readLoop;

END IF;

		-- select c_tableName;

		SET @tableName = c_tableName;
		-- SET my_sqll =@tableName;
		-- SET @ms = my_sqll;
		-- select @ms;
PREPARE s1 FROM	@tableName;
-- EXECUTE s1 using @tableName,@tableName;
EXECUTE s1;
DEALLOCATE PREPARE s1;

END LOOP readLoop;-- 关闭游标
CLOSE cr;

END