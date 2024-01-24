from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Amigo, Capturado, Deseado, Favorito, Pokemon, RegistroIntercambio, Usuario
import json

# Create your views here.

def buscar_amigo(request, nick_solicitado):
    usuario = Usuario.objects.get(nickname=nick_solicitado)
    amigos = Amigo.objects.filter(id_usuario=usuario)
    lista = []

    for amigo_relacion in amigos:
        # Acceder a los objetos Usuario relacionados
        info_amigo = amigo_relacion.id_amigo

        diccionario = {}
        diccionario['nickname'] = info_amigo.nickname
        diccionario['avatar'] = info_amigo.avatar
        lista.append(diccionario)

    return JsonResponse(lista, safe=False)

        



    
