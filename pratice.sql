#create table countries
create table countries(
country_id int not null,
country_name char(25),
region_id int
);

create table if not exists dup_countries like countries;

#Create duplicate table
CREATE TABLE IF NOT EXISTS dup_countries
AS SELECT * FROM  countries;


# Write a SQL statement to create a table named jobs including columns job_id, job_title, 
#min_salary, max_salary and 
#check whether the max_salary amount exceeding the upper limit 25000.
create table jobs(
job_id int not null,
job_title char(30) not null,
min_salary decimal(16,8),
max_salary decimal(16,8),
check(max_salary>=25000)
);

#Write a SQL statement to create a table named countries including columns country_id, 
#country_name and region_id and make sure that no countries except Italy, 
#India and China will be entered in the table.
create table countries(
country_id int,
country_name char(40),
check(country_name in('Italy','India','China')),
region_id int
);

 #Write a SQL statement to create a table named countries including columns country_id,country_name 
 #and region_id and make sure that no duplicate data against column 
 #country_id will be allowed at the time of insertion.
 CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL,
UNIQUE(COUNTRY_ID)
);

 #Write a SQL statement to create a table named jobs including columns job_id, job_title, 
 #min_salary and max_salary, and make sure that, the default value for job_title is blank and 
 #min_salary is 8000 and max_salary 
 #is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
create table jobs(
job_id int not null,
job_title int not null default '',
min_sallery decimal(10,6) default 8000,
max_sallery decimal(10,6) default null
)

#Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which 
#will not contain any duplicate data at the time of insertion.
create TABLE IF NOT EXISTS countries ( 
COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID decimal(10,0) NOT NULL
);

#Write a SQL statement to create a table countries including columns country_id, country_name and region_id and 
#make sure that the combination of columns country_id and region_id will be unique.
create table countries(
COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
COUNTRY_NAME varchar(40) DEFAULT NULL,
REGION_ID decimal(10,0) NOT NULL,
primary key (COUNTRY_ID,REGION_ID)
);

#Write a SQL statement to insert a record with your own value into the table countries against each columns.
insert into countries value(01,'usa','001');	

#Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
INSERT INTO countries (COUNTRY_ID,REGION_ID) VALUES(02,002);

#Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
CREATE TABLE IF NOT EXISTS country_new
AS SELECT * FROM countries;
select * from country_new;

#Write a SQL statement to insert NULL values against region_id column for a row of countries table.
INSERT INTO countries (country_id,country_name,region_id) VALUES(03,'India',NULL);

#Write a SQL statement to insert 3 rows by a single insert statement.
INSERT INTO countries VALUES(04,'India',004),
(05,'USA',005),(06,'UK',006);

#Write a SQL statement insert rows from country_new table to countries table.
insert into countries select * from country_new;

#Write a SQL statement to change the email column of employees table with 'not available' for all employees.
update employee set emial='not available';

#Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for 
#all employees.
update employee set email='not available', commission_pct='0.01';

#Write a SQL statement to change the email and commission_pct column of employees table with 'not available' and 0.10 for 
#those employees whose department_id is 110.

update employee set email='not availabe', comission_pct='0.01' where department_id=110;

#Write a SQL statement to change the email column of employees table with 'not available' for 
#those employees who belongs to the 'Accounting' department.
update employee set email='not available' where department_id=(
select departmet_id from depratment where department_name='Accounting'
);

#Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 
#5000.
update employee set salary=8000 where employuee_id=10-5 and sallery <5000;

#Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 
#and the existing job ID does not start with SH.
update employee set job_id='sh_clerk' where employee_id=118 and  department_id=30 and not jon_id like 'sh%';


#Write a SQL statement to add a column region_id to the table locations.
alter table location add region_id int;

#Write a SQL statement to add a columns ID as the first column of the table locations.
ALTER TABLE locations
ADD ID  INT FIRST;

#Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE locations
ADD region_id INT 
AFTER state_province;

#Write a SQL statement change the data type of the column country_id to integer in the table locations.
alter table location modify country_id int;

