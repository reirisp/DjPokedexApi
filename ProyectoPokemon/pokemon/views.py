from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import check_password, make_password
import json, jwt
from .models import Amigo, Capturado, Deseado, Favorito, Pokemon, RegistroIntercambio, Usuario
from django.core.paginator import Paginator
import datetime

# Create your views here.
def login(request):
    return HttpResponse("<h1>Hola</h1>");

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
            
            # Guardamos el registro del nuevo usuario en la bbdd
            #nuevo_usuario.save()

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
            return JsonResponse({'error': str(error)}, status=400)

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
