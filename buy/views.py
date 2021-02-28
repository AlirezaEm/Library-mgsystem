from django.shortcuts import render
import pyodbc

# Create your views here.
def showbuy (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select * from [librarymg.Buy] b join [librarymg.Member] m on b.smssn=m.Ssn join [librarymg.Book] a on b.sbcode=a.Bcode")
    result = cursor.fetchall()
    return render(request, 'buy\showbuy.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('buy_cssn') and request.POST.get('buy_bcode') and request.POST.get('buy_mssn'):
            cursor = conn.cursor()
            cursor.execute("insert into [librarymg.Buy] values('" + request.POST.get('buy_cssn') + "' , ' " + request.POST.get('buy_bcode') + "' , ' " + request.POST.get('buy_mssn') + " ')")
            cursor.commit()
            return render( request, 'buy\insert.html')
        else:
            return render( request, 'buy\insert.html')
    else:
         return render( request, 'buy\insert.html')   