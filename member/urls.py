from django.urls import path
from . import views

urlpatterns = [
    path('', views.showmember),
    path('/add', views.insert),
    path('/delete', views.delete),
]
