from django.db import models

# Create your models here.

class sqlservconn (models.Model):
    cssn = models.IntegerField(primary_key=True)
    Fname = models.CharField(max_length= 15)
    Lname = models.CharField(max_length=15)
    Birthday = models.DateField()
    Salary = models.IntegerField()

