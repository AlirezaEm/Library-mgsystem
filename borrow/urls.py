from django.urls import path
from . import views

urlpatterns = [
    path('', views.showborrow),
    path('/add', views.insert),
]
