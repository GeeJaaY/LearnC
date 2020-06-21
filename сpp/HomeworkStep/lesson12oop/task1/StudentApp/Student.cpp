#include "Student.h"

Student::Student(const char* n, int y) //����������� �����
{
	year = y;
	name = _strdup(n); //name = new char[strlen(n + 1)]; strcpy(name, n);
}

Student::Student()//����������� �� ����������
{
	name = _strdup("empty");
	year = 0;
}

Student::Student(const Student& obj)//����������� ����������� �������� �������������������� ������ �� ������ ���� �� ���
{
	year = obj.year;
	name = _strdup(obj.name);
}

Student::Student(Student&& obj) noexcept// ����������� ����������� ������� ��������� ������ rvalue
{
	year = obj.year;
	name = obj.name;
	obj.name = nullptr;
}

Student::~Student()//����������
{
	delete[]name;
}

int Student::getYear()const// ������ ��� ����������� ��������
{
	return year;
}

void Student::setYear(int val) // ������ ��� ��������� � �������� �������� 
{
	year = val;
}

const char* Student::getName()const
{
	return name;
}

void Student::setName(const char* val)
{
	delete[]name;
	name = _strdup(val);
}

void Student::Show()const
{
	cout << "Name: " << name << "; Year: " << year << "\n";
}
