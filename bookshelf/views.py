from django.shortcuts import render
import pyodbc

# Create your views here.
def showbookshelf (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select * from [librarymg.Bookshelf] a, [librarymg.Book] b where b.Bsid=a.Id and b.Bcode not in( select sbcode from [librarymg.Buy] ) and b.Bcode not in( select Sbcode from [librarymg.Borrow] )")
    result = cursor.fetchall()
    return render(request, 'bookshelf\showbookshelf.html',{'sqlservconn':result})
