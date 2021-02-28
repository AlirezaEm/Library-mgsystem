from django.urls import path
from . import views

urlpatterns = [
    path('', views.showshelfguy),
    path('/add', views.insert),
    path('/delete', views.delete),
]
