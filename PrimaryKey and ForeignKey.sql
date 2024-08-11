create database bank_customer;

create table bank_details (id int not null unique,bank_id int primary key,bank_name varchar(25) unique,
branch_name varchar(25),branch_code int,ifsc_code varchar(20) unique not null,branch_location varchar(25),
no_of_employee int check(no_of_employee>20),contact_number bigint ,established_year varchar (20));
select * from bank_details;
desc bank_details;

insert into bank_details value(1,1001,'SBI','Hassan Circle',041114,'SBIN0041114','Tiptur',28,9008028126,'1 July 1955');
insert into bank_details value(2,1002,'Karnataka Bank','Tiptur Main',000754,'KARB0000754','Tiptur',22,8134251962,'18 February 1924');
insert into bank_details value(3,1003,'Axis Bank','Rajajinagar',559,'UTIB0000559','Bangaluru',40,18605005555,'3 December 1993');
insert into bank_details value(4,1004,'ICICI Bank','Mangalore',000014,'ICIC0000014','Mangalore',40,9090876567,'1994');
insert into bank_details value(5,1005,'HDFC Bank','Vijayanagar',00312,'HDFC0000312','Bangaluru',30,7867564534,'August 1994');
insert into bank_details value(6,1006,'Canara Bank','Mahaveer Road',000502,'CNRB0000502','Bagalkot',30,8354220523,'1 July 1906');
insert into bank_details value(7,1007,'Syndicate Bank','KRC Circle',000534,'SYNB0000534','Belagavi',24,9876764563,'20 October 1925');
insert into bank_details value(8,1008,'Corporation Bank','Shankar Road',17505,'CORP0003061','Turuvekere',30,9538043555,'12 March 1906');
insert into bank_details value(9,1009,'Vijaya Bank','Adugodi',001001,'VIJB0001001','Bengaluru',40,9898923231,'23 October 1931');
insert into bank_details value(10,1010,'Kotak Mahindra Bank','Chandan Complex',82434,'KKBK0008243','Davangere',21,9999999999,'21 November 1985');
insert into bank_details value(11,1011,'Bank of Baroda','Hanumanthappa Circle',98989,'BBBK234321','Chikmagaluru',22,18005700,'20 July 1908');
insert into bank_details value(12,1012,'UNION Bank','Vadiraju Bhavan',081640,'UBIN0801640','Gulbarga',25,2085923154,'11 November 1919');
insert into bank_details value(13,1013,'Bank of India','Bagalkot',8465,'BKID0008465','Bagalkot',34,7676756543,'7 September 1906');
insert into bank_details value(14,1014,'Vikas Grameena Bank','Gokak',02415,'KVGB0002415','Gokak',21,8987876567,'12 September 2005');
insert into bank_details value(15,1015,'Kaveri Grameena Bank','Gubbi',000169,'KGRB0000169','Gubbi',21,223281,'1 November 2012');

alter table bank_details add constraint  branch_name_uni unique (branch_name);
desc bank_details;

create table cust_details (id int not null unique,bank_id int,cust_id int,cust_name varchar(25) unique,dob varchar(25),
              address varchar(30) ,phone_number bigint,constraint phone_number_chk check(phone_number>=10),
              email varchar(50),account_type varchar(30),account_balance double(15, 2),
              foreign key (bank_id) references bank_details(bank_id) on update cascade on delete cascade,
              primary key(cust_id));
desc cust_details;
select * from cust_details;

insert into cust_details value(1,1001,2001,'Sangeetha','02/06/2002','Tiptur',9008028126,'masangeetha12@gmail.com',
                               'Savings Account',5000.00);        
insert into cust_details value(2,1002,2002,'Priyanka','13/03/2002','Tiptur',9098989876,'priyankapr13@gmail.com',
                               'Savings Account',4999.67);
insert into cust_details value(3,1003,2003,'Priya','03/05/2001','Tumkur',8985745676,'priyapriya12@gmail.com',
                               'Current Account',50000.87);
insert into cust_details value(4,1004,2004,'Baba','12/12/2000','Hassan',7676734323,'babasome232@gmail.com',
                               'Business Account',55000.98);
insert into cust_details value(5,1005,2005,'Daisy','14/06/1998','Bengaluru',8784343234,'daisydaisy121@gmail.com',
                               'Savings Account',4500.00);
insert into cust_details value(6,1006,2006,'Rama','12/03/2000','Belagavi',5454345897,'ramarama132@gmail.com',
                               'Savings Account',3200.00);
insert into cust_details value(7,1007,2007,'Sunil','12/06/1995','Bengaluru',7658764567,'sunilsunil34@gmail.com',
							  'Savings Account',10000.00);
insert into cust_details value(8,1008,2008,'Haji','04/06/2001','Belagavi',4543676656,'haji1234@gmail.com',
                               'Business Account',50000.64);
insert into cust_details value(9,1009,2009,'Harish','18/07/2000','Chitradurga',5454565435,'harishahr12@gmail.com',
                               'Business Account',45000.64);
insert into cust_details value(10,1010,2010,'Mamatha','12/10/1998','Bengaluru',4323432434,'mamathamamath12@gmail.com',
							  'Savings Account',15000.98);
insert into cust_details value(11,1011,2011,'Akshara','03/06/1993','Shivamogga',5453454324,'aksharaash12@gmail.com',
                               'Business Account',80000.78);
insert into cust_details value(12,1012,2012,'Shantanu','04/06/1994','Bagalkote',5453454345,'shantanucho34@gmail.com',
                               'Business Account',100000.98);
insert into cust_details value(13,1013,2013,'Vinoda','13/09/2000','Gadag',3234323432,'vinodavinod56@gmail.com',
                               'Current Account',54354.98);
insert into cust_details value(14,1014,2014,'Amith','02/05/2001','Bengaluru',4343678987,'amitjamit36@gmail.com',
                               'Savings Account',43534.00);
insert into cust_details value(15,1015,2015,'Suhas','09/10/1998','Shivamogga',4345765674,'suhassuhass34@gmail.com',
                               'Savings Account',3000.00);
select * from cust_details;
alter table cust_details add constraint email_uni unique(email);
desc cust_details;
              
create table loan_details (id int not null unique,cust_id int,loan_id int ,loan_amount double(15, 2) check (loan_amount>50000),
						interest_rate double(5, 2),start_date varchar(20),end_date varchar(20),loan_status varchar(20),
                        primary key(loan_id),
                        foreign key (cust_id) references cust_details(cust_id) on update cascade on delete cascade);
 desc loan_details; 
 
/* Each loan that you have invested in is assigned one of four loan statuses and which mean the following:
Performing – a healthy loan with no issues. All loan payments are up to date.
Late – the loan has one or more interest payments which are late.
Overdue – there has been a delay of more than a day on the scheduled repayment date of the loan.
Default – the loan has been declared as being in default and a recovery process has been initiated.*/

insert into loan_details value(1,2001,3001,55000.00,5.34,'01/01/2024','02/02/2025','Performing');
insert into loan_details value(2,2002,3002,57000.00,6.34,'02/01/2024','03/02/2025','Late');
insert into loan_details value(3,2003,3003,58000.00,7.34,'03/01/2024','04/02/2025','Overdue');
insert into loan_details value(4,2004,3004,60000.00,6.34,'04/01/2024','05/02/2025','Performing');
insert into loan_details value(5,2005,3005,65000.00,3.34,'05/01/2024','06/02/2025','Performing');
insert into loan_details value(6,2006,3006,67000.00,5.34,'06/01/2024','07/02/2025','Default');
insert into loan_details value(7,2007,3007,68000.00,5.99,'07/01/2024','08/02/2025','Late');
insert into loan_details value(8,2008,3008,80000.00,4.34,'08/01/2024','09/02/2025','Performing');
insert into loan_details value(9,2009,3009,85000.00,3.34,'09/01/2024','10/02/2025','Overdue');
insert into loan_details value(10,2010,3010,150000.00,2.34,'11/01/2024','11/02/2025','Overdue');
insert into loan_details value(11,2011,3011,95000.00,4.00,'12/01/2024','13/02/2025','Performing');                             
insert into loan_details value(12,2012,3012,67000.00,5.14,'12/01/2024','13/02/2025','Late');
insert into loan_details value(13,2013,3013,51000.00,7.34,'13/01/2024','14/02/2025','Overdue');
insert into loan_details value(14,2014,3014,77000.00,3.99,'14/01/2024','15/02/2025','Performing');
insert into loan_details value(15,2015,3015,500000.00,3.00,'15/01/2024','16/02/2025','Performing');

insert into loan_details value(16,2011,3016,100000.00,2.00,'03/06/2022','03/08/2024','Performing');/*pk con't be duplicate but fk can be duplicate*/
/*insert into loan_details value(16,2011,3016,100000.00,2.00,'03/06/2022','03/08/2024','Performing'); error bec of duplicate entry of 3016 pk*/
update loan_details set start_date ='11/02/2024' where id=12;
alter table loan_details add constraint start_date_uni unique (start_date);

select * from loan_details;
			
					
create table insurance_details (id int not null,loan_id int,cust_id int,bank_id int,policy_number bigint unique check (policy_number>=9),
                               policy_type varchar(50),start_date varchar(20),end_date varchar(20),
                               foreign key (loan_id) references loan_details(loan_id),
							   foreign key (cust_id) references cust_details(cust_id),
                               foreign key (bank_id) references bank_details(bank_id));
desc insurance_details;                        
  
select * from insurance_details;
insert into insurance_details value(1,3001,2001,1001,105454354,'Life Insurance','02/06/2005','13/12/2040');
insert into insurance_details value(2,3002,2002,1002,123456789,'Retirement Insurance','10/06/2020','13/11/2040');
insert into insurance_details value(3,3003,2003,1003,105454357,'Business Insurance','02/07/2020','13/10/2040');
insert into insurance_details value(4,3004,2004,1004,105445354,'Child Insurance','04/04/2005','13/08/2040');
insert into insurance_details value(4,3004,2004,1004,105454344,'Life Insurance','02/06/2010','13/12/2050');
insert into insurance_details value(5,3005,2005,1005,125454354,'Senior citizen travel insurance','12/06/2012','13/12/2050');
insert into insurance_details value(6,3006,2006,1006,103354354,'Motor insurance','22/05/2005','13/06/2040');
insert into insurance_details value(7,3007,2007,1007,100654354,'Money Back Policy','26/06/2020','13/12/2030');
insert into insurance_details value(8,3008,2008,1008,104054354,'Health Insurance','12/10/2025','13/12/2040');
insert into insurance_details value(9,3009,2009,1009,005454354,'Home Insurance','02/06/2020','13/12/2040');
insert into insurance_details value(10,3010,2010,1010,100054354,'Fire Insurance','12/12/2005','10/12/2040'); 

insert into insurance_details value(11,3008,2002,1009,654356532,'Whole Life Insurance','02/06/2001','Death');
insert into insurance_details value(12,3010,2010,1010,100054454,'Gold Insurance','12/12/2005','10/12/2040');

alter table insurance_details add constraint policy_type_uni unique (policy_type);
desc insurance_details;

select * from insurance_details where bank_id=1009;
select * from insurance_details where cust_id=2010; 
select * from cust_details where bank_id=1004;
select id,start_date,policy_type from insurance_details where policy_type='Home Insurance';
