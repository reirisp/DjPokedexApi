from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Amigo, Capturado, Deseado, Favorito, Pokemon, RegistroIntercambio, Usuario
import json

# Create your views here.

def login(request):
    return HttpResponse("<h1>Hola</h1>");

def get_capturados(request):
    if request.method != 'GET':
        return None
    lista=Capturado.objects.filter(id_usuario=1)#.all()
    
    respuesta_final=[]
    for fila_sql in lista:
        pokemon_actual=Pokemon.objects.get(id=fila_sql.id_pokemon.id)
        diccionario={}
        diccionario['id_pokemon']=pokemon_actual.id
        diccionario['nombre']=pokemon_actual.nombre
        diccionario['imagen']=pokemon_actual.urlimagen
        diccionario['tipo']=pokemon_actual.tipo
        respuesta_final.append(diccionario)
    return JsonResponse(respuesta_final, safe=False)