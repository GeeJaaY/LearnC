//�������� ������� : ������������.�����������.����������� �����������.
//�������� �����, ����������� ������ ���������.�������� ��������
//����� ����������� � ������� ���������������� ������.
//������� : 
//	���� : 
//	    ���; 
//      ��� ��������. 
//������:
//	����:
//		���������;
//		����;
//		���������� ���������;
//		��������.
//	������:
//		���������� �������� � ������;
//		�������� �������� �� ������(�� �������);
//		����� �� ����� ���� ���������;

#include "Student.h"
#include "Group.h"

int input_int()
{
    int i;
    cin >> i;
    while (cin.fail())
    {
        cin.clear();
        cin.ignore(100, '\n');
        cout << "Wrong input, enter digit pls." << endl;
        cin >> i;
    }
    return i;
}

int main()
{
    setlocale(LC_ALL, "rus");
    Group group("Botanics", 3);
    group.AddStudent(Student("Petrov", 1990));
    group.AddStudent(Student("Ivanov", 1900));
    group.AddStudent(Student("Petrov", 2000));
    group.AddStudent(Student("Sidorov", 2010));
    int year = 0;
    int el = 0;
    int choice = 0;
    while (choice != 4)
    {
        cout << "\n�������� ��������:\n1.����� �� �����;\n2.�������� �������� � ������\n3.�������\n4.�����." << endl;
        choice = input_int();
        switch (choice)
        {
        case 1:
            group.Show();
            break;
        case 2:
            char name[1000];
            cout << "������� ���(����) � ������� Enter\n";
            cin.ignore();
            cin.getline(name, 1000);
            cout << "������� ��� �������� � ������� Enter\n";
            year = input_int();
            group.AddStudent(Student(name, year));
            group.Show();
            break;
        case 3:
            cout << "������� ����� �������� ������� ����� �������: ";
            el = input_int();
            group.DelStudent(el);
            group.Show();
            break;
        default:
            choice = 4;
            break;
        }
    }
    return 0;
}