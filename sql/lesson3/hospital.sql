--create database Hospital
--go
--use Hospital

--create table Departments
--(
--ID int identity(1,1) not null primary key,
--Building int not null CHECK(Building>0 AND Building<=5),
--Financing money not null CHECK(Financing>=0) default 0,
--Floor int not null CHECK(Floor>0),
--Name nvarchar(100) not null CHECK(Name !='') unique
--)

--create table Diseases
--(
--ID int identity(1,1) not null primary key,
--Name nvarchar(100) not null CHECK(Name !='') unique,
--Severity int not null CHECK(Severity>0) default 1
--)

--create table Doctors
--(
--ID int identity(1,1) not null primary key,
--Name nvarchar(max) not null CHECK(Name !=''),
--Phone char(10),
--Premium money not null CHECK(Premium>=0) default 0,
--Salary money not null CHECK(Salary>0),
--Surname nvarchar(max) not null CHECK(Surname !='')
--)

--create table Examinations
--(
--ID int identity(1,1) not null primary key,
--DayOfWeek int not null CHECK(DayOfWeek>0 AND DayOfWeek<8),
--EndTime time not null,
--Name nvarchar(100) not null CHECK(Name !='') unique,
--StartTime time not null CHECK(StartTime>'08:00:00' AND StartTime<'18:00:00'),
--check (EndTime > StartTime)
--)

--create table Wards
--(
--ID int identity(1,1) not null primary key,
--Building int not null CHECK(Building>0 AND Building<=5),
--Floor int not null CHECK(Floor>0),
--Name nvarchar(20) not null CHECK(Name !='') unique
--)

--INSERT INTO Departments
--(Building, Financing, Floor, Name)
--VALUES
--(1,1000,1, '�������'),
--(2,2222,2, '����������'),
--(3,3333,3, '�����������'),
--(4,4444,4, '�����������������'),
--(5,5555,5, '�����������');

--INSERT INTO Diseases
--(Name, Severity)
--VALUES
--('���',10),
--('����',23),
--('��������',3),
--('������',4),
--('��������',5);

--INSERT INTO Doctors
--(Name, Phone, Premium, Salary, Surname)
--VALUES
--('������� �����������','+6112345', 5000, 10000, '�����'),
--('���� ������������','	+4312345', 4000, 11000, '�����������'),
--('������� ����������','+9941234', 3000, 12000, '������'),
--('���� ��������','+3551234', 2000, 13000, '������'),
--('���� ��������','+2131234', 3000, 14000, '����������');

--INSERT INTO Examinations
--(DayOfWeek, EndTime, Name, StartTime) 
--VALUES 
--(1,'12:00','������� �����������','08:10'),
--(2,'13:00','��-�����������','09:00'),
--(3,'14:00','��������������','10:00'),
--(4,'15:00','���','11:00'),
--(5,'16:00','���','12:00');

--INSERT INTO Wards
--(Building, Floor, Name)
--VALUES 
--(1,2,'�����'),
--(1,3,'������'),
--(1,4,'��������'),
--(2,3,'����'),
--(1,3,'���������');

--1. ������� ���������� ������� �����.
--select * 
--FROM Wards

--2. ������� ������� � �������� ���� ������.
--select Surname, Phone 
--FROM Doctors

--3. ������� ��� ����� ��� ����������, �� ������� ������������� ������
--select distinct Floor 
--from Wards

--4. ������� �������� ����������� ��� ������ �Name of Disease� � ������� �� ������� ��� ������ �Severity of Disease�
--select Name as 'Name of Disease' , Severity as 'Severity of Disease'
--FROM Diseases

--5. ������������ ��������� FROM ��� ����� ���� ������ ���� ������, ��������� ��� ��� ����������.
--select D.Name, E.Name, W.Name
--FROM Doctors AS D, Examinations AS E, Wards AS W

--6. ������� �������� ���������, ������������� � ������� 5 � ������� ���� �������������� ����� 30000.
--select Name 
--FROM Departments 
--WHERE Building = 5 AND Financing < 30000

--7. ������� �������� ���������, ������������� � 3-� ������� � ������ �������������� � ��������� �� 12000 �� 15000.
--select Name 
--FROM Departments 
--WHERE Building = 3 AND Financing > 12000 and Financing < 15000 

--8. ������� �������� �����, ������������� � �������� 4 � 5 �� 1-� �����.
--select Name 
--from Wards
--WHERE Building = 4 or Building = 5 and Floor = 1 

--9. ������� ��������, ������� � ����� �������������� ���������, ������������� � �������� 3 ��� 6 � �������
--���� �������������� ������ 11000 ��� ������ 25000.
--select Name , Financing
--from  Departments 
--WHERE (Building = 3 or Building = 6) AND Financing < 12000 and Financing > 15000

--10. ������� ������� ������, ��� �������� (����� ������ � ��������) ��������� 1500.
--select Surname
--from Doctors
--WHERE (Salary + Premium) > 1500

--11. ������� ������� ������, � ������� �������� �������� ��������� ����������� ��������
--select Surname
--from Doctors
--WHERE Salary / 2 > Premium * 3

--12. ������� �������� ������������ ��� ����������, ���������� � ������ ��� ��� ������ � 12:00 �� 15:00. 
--select distinct Name
--from Examinations 
--WHERE (DayOfWeek = 1 or DayOfWeek = 2 or DayOfWeek = 3) and StartTime = '12:00:00' and EndTime = '15:00:00'

--13. ������� �������� � ������ �������� ���������, ������������� � �������� 1, 3, 8 ��� 10.
--select Name
--from  Departments 
--WHERE Building = 1 or Building = 3 or Building = 8 or Building = 10

--14. ������� �������� ����������� ���� �������� �������, ����� 1-� � 2-�.
--select Name
--FROM Diseases
--where Severity != 1 and Severity ! = 2

--15. ������� �������� ���������, ������� �� ������������� � 1-� ��� 3-� �������.
--select Name
--from  Departments 
--WHERE Building != 1 and Building != 3

--16. ������� �������� ���������, ������� ������������� � 1-� ��� 3-� �������.
--select Name
--from  Departments 
--WHERE Building = 1 and Building = 3

--17. ������� ������� ������, ������������ �� ����� �N�
--select Surname
--from Doctors
--where Surname LIKE 'N%'
