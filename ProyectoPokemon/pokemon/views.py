from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Amigo, Capturado, Deseado, Favorito, Pokemon, RegistroIntercambio, Usuario
import json

# Create your views here.

def login(request):
    return HttpResponse("<h1>Hola</h1>");