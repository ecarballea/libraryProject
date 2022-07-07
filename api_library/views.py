from django.shortcuts import render
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Book, Reader, Borrower
from .serializers import BookSerializer, ReaderSerializer, BorrowerSerializer
from django.http.response import JsonResponse
from django.core.serializers import serialize

# Create your views here.
       
class Book_APIView(APIView):
    def get(self, request, format=None):
        book = Book.objects.all()
        serializer = BookSerializer(book, many=True)
        
        return Response(serializer.data)
    
    def post(self, request, format=None):
        serializer = BookSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class Book_APIView_Detail(APIView):
    
    def get_object(self, pk):
        try:
            return Book.objects.get(pk=pk)
        except Book.DoesNotExist:
            raise Http404    
    
    def get(self, request, id_book, format=None):
        book = self.get_object(id_book)
        serializer = BookSerializer(book)
        return Response(serializer.data)
    
    def put(self, request, id_book, format=None):
        book = self.get_object(id_book)
        serializer = BookSerializer(book, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, id_book, format=None):
        book = self.get_object(id_book)
        book.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
     
class Borrower_APIView(APIView):
    
    def get(self, request, format=None):
        borrower = Borrower.objects.all()
        serializer = BorrowerSerializer(borrower, many=True)
        return Response(serializer.data)
        
    def post(self, request, format=None):
        try:
            # serializer = BorrowerSerializer(data=request.data)
            
            book = Book.objects.get(id=request.data['book'])
            if book.status:
                return Response( {"detail": "This book has been borrowed already."},
                                status=status.HTTP_400_BAD_REQUEST)
            
            reader = Reader.objects.get(id=request.data['reader'])    
            borrow_date = request.data['borrow_date']

            borrower = Borrower.objects.create(reader=reader, book=book, borrow_date=borrow_date)

            serializer = {
                "id": borrower.id,
                "reader": borrower.reader_id,
                "book": borrower.book_id,
                "borrow_date": borrower.borrow_date
            }
            book.status = True
            book.save()
            
            return Response(serializer, status=status.HTTP_201_CREATED)
        except: #Book.DoesNotExist:
            raise Http404
        # except Reader.DoesNotExist:
        #     raise Http404
        