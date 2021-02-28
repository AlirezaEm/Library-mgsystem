from django.shortcuts import render
import pyodbc
# Create your views here.

#from django.template import loader
#from django.http import HttpResponse
#def cashtest (req2):
 #   template = loader.get_template('cashier\cashier.html')
  #  contex = {}
   # return(HttpResponse(template.render(contex, req2)))
    
def showcashier (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    cursor = conn.cursor()
    cursor.execute("select *, DATEDIFF(year, [Birthday], GETDATE()) AS age from [librarymg.Cashier] left join [librarymg.Cashphone] on cssn=Cpssn left join [librarymg.Cashaddress] on cssn=cassn")
    result = cursor.fetchall()
    return render(request, 'cashier\showcashier.html',{'sqlservconn':result})

def insert (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('cashier_cssn') and request.POST.get('cashier_fname') and request.POST.get('cashier_lname') and request.POST.get('cashier_birthday') and request.POST.get('cashier_salary'):
            cursor = conn.cursor()
            cursor2 = conn.cursor()
            cursor3 = conn.cursor()
            cursor.execute("insert into [librarymg.Cashier] values(' " + request.POST.get('cashier_cssn')+ " ' , ' " + request.POST.get('cashier_fname') + " ' , ' " + request.POST.get('cashier_lname') + " ' , ' " + request.POST.get('cashier_birthday') + " ' , ' " +  request.POST.get('cashier_salary') + " ')"  )
            cursor2.execute("insert into [librarymg.Cashphone] values('" + request.POST.get('cashier_cssn') + "' , ' " + request.POST.get('cashier_phonenum') + " ')")
            cursor3.execute("insert into [librarymg.Cashaddress] values('" + request.POST.get('cashier_cssn') + "' , ' " + request.POST.get('cashier_hnum') + " ', ' " + request.POST.get('cashier_street') + " ', ' " + request.POST.get('cashier_city') + " ')")
            cursor.commit()
            cursor2.commit()
            cursor3.commit()
            return render( request, 'cashier\insert.html')
        else:
            return render( request, 'cashier\insert.html')
    else:
         return render( request, 'cashier\insert.html')

def delete (request):
    conn=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};'
                          'Server=DESKTOP-IVD447A;'
                          'Database=librarymg;'
                          'Trusted_Connection=yes;')
    if request.method=="POST":
        if request.POST.get('cashier_cssn'):
            cursor = conn.cursor()
            cursor.execute("delete from [librarymg.Cashier] where cssn=" + request.POST.get('cashier_cssn'))
            cursor.commit()
            return render( request, 'cashier\delete.html')
        else:
            return render( request, 'cashier\delete.html')
    else:
         return render( request, 'cashier\delete.html')
         