from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import check_password, make_password
import json, jwt
from .models import Amigo, Capturado, Deseado, Favorito, Pokemon, RegistroIntercambio, Usuario
from django.core.paginator import Paginator
import datetime
from django.contrib.auth import authenticate, login
from django.utils.decorators import method_decorator
from django.views import View


# Create your views here.
# Vista GET Capturados
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
  
  
# Configuración de JWT (Json Web Token)
SECRET_KEY = 'claveSecreta.' # Para almacenar la secret key de forma segura

# Función para crear el token JWT
def create_token(id):
    # Define el payload con la información del usuario y la fecha de expiración
    payload = {
        'id': id,
        'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1),
        'iat': datetime.datetime.utcnow()
    }
    # Codifica el payload en un token JWT usando la clave secreta
    token = jwt.encode(payload, SECRET_KEY, algorithm='HS256')
    return token

  
# Función para verificar un token JWT en una solicitud HTTP
@csrf_exempt
def verify_token(request):
    # Obttenemos el token de la cabecera de autorización
    token = request.META.get('HTTP_AUTHORIZATION')
    if not token:
        # Si el token no está presente devolvemos un error
        return JsonResponse({'message': 'Token no encontrado '}, status=401), None
    try:
        # Si el token comienza con 'Bearer', lo divide y decodifica el payload
        if token.startswith('Bearer '):
            token = token.split(' ')[1]
        payload = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])

        # Si la decodificación es exitosa devuelve el payload
        return None, payload
    
    except jwt.ExpiredSignatureError:
        # Si el token ha expirado devolvemos un mensaje de error
        return 'El token ha expirado!', None

      
# Vista para el registro de nuevos usuarios
@csrf_exempt
def register(request):
    if request.method == 'POST':
        try:
            # Convierte el cuerpo de la solicitud a un diccionario JSON
            datosFormulario = json.loads(request.body)

            # Hashea la contraseña antes de almacenarla en la base de datos
            contraseñaHasheada  = make_password(datosFormulario['contraseña'])
            
            # Crea un nuevo usuario utilizando los datos del cuerpo de la solicitud
            nuevo_usuario = Usuario(
                nombre=datosFormulario['nombre'],
                apellidos=datosFormulario['apellidos'],
                email=datosFormulario['email'],
                nickname=datosFormulario['nickname'],
                contraseña=contraseñaHasheada, # Almacenar la contraseña hasheada
                fecha=datetime.datetime.now(), # Almacena la fecha de registro
            )

            # Generamos el token utilizando la función create_token (creada anteriormente)
            token = create_token(nuevo_usuario.id)

            # Asignamos el token al campo correspondiente del modelo Usuario
            nuevo_usuario.token = token

            # Guardamos el registro del nuevo usuario en la bbdd
            nuevo_usuario.save()

            # Devuelve un mensaje de éxito
            return JsonResponse({'message': 'Usuario registrado exitosamente'}, status=201)
        
        except Exception as error:
            # Si hay algún error durante el registro devolvemos un mensaje de error
            return HttpResponse({'error': str(error)}, status=400)

          
# Vista buscar amigos
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


# Vista login
@csrf_exempt
def login(request):
    # Verifica si la solicitud es de tipo POST.
    if request.method == 'POST':
        try:
            # Carga los datos del cuerpo de la solicitud y los convierte de JSON a un diccionario de Python.
            loguearse = json.loads(request.body)

            # Busca un usuario en la base de datos que coincida con el 'nickname' proporcionado.
            # Si no encuentra al usuario lanzamos un mensaje de error
            usuario = Usuario.objects.get(nickname=loguearse['nickname'])

            # Compruebamos si la contraseña proporcionada coincide con la contraseña almacenada (hasheda) del usuario.
            if check_password(loguearse['contraseña'], usuario.contraseña):
                # Si la contraseña es correcta, genera un token
                token = create_token(usuario.id)

                # Devuelve una respuesta JSON con el token y el estado HTTP 200 (OK).
                return JsonResponse({'token': token}, status=200)
            else:
                # Si la contraseña no es correcta, devuelve una respuesta JSON con un mensaje de error.
                return JsonResponse({'error': 'Contraseña incorrecta'}, status=401)
        except Usuario.DoesNotExist:
            # Si el usuario no existe en la base de datos, devuelve una respuesta JSON con un mensaje de error.
            return JsonResponse({'error': 'Usuario no encontrado'}, status=404)


# Vista eliminar amigo
@csrf_exempt
def modificar_amigo(request, nick_amigo, nick_usuario):
    usuario = Usuario.objects.get(nickname = nick_usuario)
    amigo = Usuario.objects.get(nickname = nick_amigo)
    
    # Verificar el token antes de continuar
    error, payload = verify_token(request)
    if error:
        return JsonResponse({'message': str(error)}, status=401, safe = False)

    # Solo llegará aquí si el token es válido
    if request.method == 'DELETE':  
        try:
            amistad = Amigo.objects.get(id_usuario=usuario.id, id_amigo=amigo.id)
            amistad_inversa = Amigo.objects.get(id_usuario = amigo.id, id_amigo = usuario.id)
        except Amigo.DoesNotExist:
            return JsonResponse({"mensaje": "Amistad no encontrada"}, status=404)
        
        #Aquí llegará sólo si la solicitud es válida
        amistad.delete()
        amistad_inversa.delete()
        return JsonResponse({"message": "Amistad eliminada con éxito"}) 
    elif request.method == 'POST':
        try:
            nueva_amistad = Amigo(
                id_usuario = usuario,
                id_amigo = amigo
            )
            nueva_amistad.save()

            nueva_amistad_inversa = Amigo(
                id_usuario = amigo,
                id_amigo = usuario
            )
            nueva_amistad_inversa.save()
            return JsonResponse({'message': 'Amistad registrada exitosamente'}, status=201)

        except Exception as error:
            return JsonResponse({'error': str(error)}, status=400, safe = False)




