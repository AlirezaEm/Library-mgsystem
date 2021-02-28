from django.urls import path
from . import views

urlpatterns = [
    path('', views.showcashier),
    path('/add', views.insert),
    path('/delete', views.delete),
]
