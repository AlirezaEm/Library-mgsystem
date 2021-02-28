from django.shortcuts import render
import pyodbc

# Create your views here.
def showborrow (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select *,DATEDIFF(day, GETDATE(),[Bexdate] ) AS reamaining_time from [librarymg.Borrow] b join [librarymg.Member] m on b.Mssn=m.Ssn join [librarymg.Book] a on b.Sbcode=a.Bcode")
    result = cursor.fetchall()
    return render(request, 'borrow\showborrow.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('borrow_cssn') and request.POST.get('borrow_bcode') and request.POST.get('borrow_mssn') and request.POST.get('borrow_bexdate'):
            cursor = conn.cursor()
            cursor.execute("insert into [librarymg.Borrow] values('" + request.POST.get('borrow_cssn') + "' , ' " + request.POST.get('borrow_bcode') + "' , ' " + request.POST.get('borrow_mssn') + "' , ' " + request.POST.get('borrow_bexdate') + " ')")
            cursor.commit()
            return render( request, 'borrow\insert.html')
        else:
            return render( request, 'borrow\insert.html')
    else:
         return render( request, 'borrow\insert.html')   