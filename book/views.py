from django.shortcuts import render
import pyodbc

# Create your views here.
def showbook (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select * from [librarymg.Book]")
    result = cursor.fetchall()
    return render(request, 'book\showbook.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('book_bcode') and request.POST.get('book_bname') and request.POST.get('book_mdate') and request.POST.get('book_genre') and request.POST.get('book_price') and request.POST.get('book_bsid'):
            cursor = conn.cursor()
            cursor.execute("insert into [librarymg.Book] values(' " + request.POST.get('book_bcode')+ " ' , ' " + request.POST.get('book_bname') + " ' , ' " + request.POST.get('book_mdate') + " ' , ' " + request.POST.get('book_genre') + " ' , ' " +  request.POST.get('book_price') + " ' , ' " + request.POST.get('book_bsid') + " ')"  )
            cursor.commit()
            return render( request, 'book\insert.html')
        else:
            return render( request, 'book\insert.html')
    else:
         return render( request, 'book\insert.html')   

def delete (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('bcode'):
            cursor = conn.cursor()
            cursor.execute("delete from [librarymg.Book] where Bcode=" + request.POST.get('bcode'))
            cursor.commit()
            return render( request, 'book\delete.html')
        else:
            return render( request, 'book\delete.html')
    else:
         return render( request, 'book\delete.html')
         