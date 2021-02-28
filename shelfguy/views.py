from django.shortcuts import render
import pyodbc

# Create your views here.

def showshelfguy (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select *,DATEDIFF(year, [Birthday], GETDATE()) AS age from [librarymg.Shelfguy] s left join [librarymg.Shelfphone] p on p.shssn=s.Shssn left join [librarymg.shelfaddress] a on s.Shssn=a.shssn")
    result = cursor.fetchall()
    return render(request, 'shelfguy\showshelfguy.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('shguy_cssn') and request.POST.get('shguy_fname') and request.POST.get('shguy_lname') and request.POST.get('shguy_birthday') and request.POST.get('shguy_salary'):
            cursor = conn.cursor()
            cursor2 = conn.cursor()
            cursor3 = conn.cursor()
            cursor.execute("insert into [librarymg.Shelfguy] values(' " + request.POST.get('shguy_cssn')+ " ' , ' " + request.POST.get('shguy_fname') + " ' , ' " + request.POST.get('shguy_lname') + " ' , ' " + request.POST.get('shguy_birthday') + " ' , ' " +  request.POST.get('shguy_salary') + " ')"  )
            cursor2.execute("insert into [librarymg.Shelfphone] values('" + request.POST.get('shguy_cssn') + "' , ' " + request.POST.get('shguy_phonenum') + " ')")
            cursor3.execute("insert into [librarymg.Shelfaddress] values('" + request.POST.get('shguy_cssn') + "' , ' " + request.POST.get('shguy_hnum') + " ', ' " + request.POST.get('shguy_street') + " ', ' " + request.POST.get('shguy_city') + " ')")
            cursor.commit()
            cursor2.commit()
            cursor3.commit()
            return render( request, 'shelfguy\insert.html')
        else:
            return render( request, 'shelfguy\insert.html')
    else:
         return render( request, 'shelfguy\insert.html')   

def delete (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('shguy_cssn'):
            cursor = conn.cursor()
            cursor.execute("delete from [librarymg.shelfguy] where Shssn=" + request.POST.get('shguy_cssn'))
            cursor.commit()
            return render( request, 'shelfguy\delete.html')
        else:
            return render( request, 'shelfguy\delete.html')
    else:
         return render( request, 'shelfguy\delete.html')