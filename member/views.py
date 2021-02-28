from django.shortcuts import render
import pyodbc



def showmember (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select *,DATEDIFF(year, [Birthday], GETDATE()) AS age from [librarymg.Member] m left join [librarymg.Memphone] p on p.Mssn=m.Ssn")
    result = cursor.fetchall()
    return render(request, 'member\member.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('member_ssn') and request.POST.get('member_fname') and request.POST.get('member_lname') and request.POST.get('member_birthday') and request.POST.get('member_regdate') and request.POST.get('member_expdate') and request.POST.get('member_cpssn'):
            cursor = conn.cursor()
            cursor2= conn.cursor()
            cursor.execute("insert into [librarymg.Member] values(' " + request.POST.get('member_ssn')+ " ' , ' " + request.POST.get('member_fname') + " ' , ' " + request.POST.get('member_lname') + " ' , ' " + request.POST.get('member_birthday') + " ' , ' " +  request.POST.get('member_regdate') + " ' , ' " +  request.POST.get('member_expdate') + " ' , ' " + request.POST.get('member_cpssn') + " ')"  )
            cursor2.execute("insert into [librarymg.Memphone] values('" + request.POST.get('member_ssn') + "' , ' " + request.POST.get('memphone_phonenum') + " ')")
            cursor.commit()
            cursor2.commit()
            return render( request, 'member\insert.html')
        else:
            return render( request, 'member\insert.html')
    else:
         return render( request, 'member\insert.html')   


def delete (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('member_ssn'):
            cursor = conn.cursor()
            cursor.execute("delete from [librarymg.Member] where Ssn=" + request.POST.get('member_ssn'))
            cursor.commit()
            return render( request, 'member\delete.html')
        else:
            return render( request, 'member\delete.html')
    else:
         return render( request, 'member\delete.html')
         