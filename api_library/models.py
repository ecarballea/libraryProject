from django.db import models
from django.core.exceptions import ValidationError 

# Create your models here.

class Book(models.Model):
    title = models.CharField(max_length=200)
    isbn = models.CharField('ISBN', max_length=13, unique=True,
                            help_text='13 Character <a href="https://www.isbn-international.org/content/what-isbn">ISBN number</a>')
    status = models.BooleanField(default=False, help_text='borrowed book?')
    
    def __str__(self):
        return self.title
    
    class Meta:
        ordering = ['title']

class Reader(models.Model):
    name = models.CharField(max_length=20)
    
    def __str__(self):
        return self.name
    
    class Meta:
        ordering = ['name']

def validate_borrow(value):
    if type(value) == int: # if is it id?
        book = Book.objects.get(id=value)
    else: # it is title
        book = Book.objects.get(title=value)
    if not book.status:
        book.status = True
        book.save()
        return value 
    else: 
        raise ValidationError("This book has been borrowed already")
    
class Borrower(models.Model):
    borrow_date = models.DateField(null=True, blank=True)
    reader = models.ForeignKey(Reader, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE, validators =[validate_borrow])
    
    def __str__(self):
        return f'{self.reader.name} borrowed {self.book.title} book on {self.borrow_date}'

    class Meta:
        ordering = ['borrow_date']
        
    def delete(self, using=None, keep_parents=False):
        self.book.status = False
        self.book.save()
        return super().delete()