"""
URL configuration for ProyectoPokemon project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from pokemon import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('register/', views.register),
    path('sesion/<int:id>', views.logout),
    path('users/<str:nick_solicitado>/', views.perfil_usuario),
       
    path('users/<str:nick_solicitado>/amigos/', views.buscar_amigo),
    path('users/<str:nick_usuario>/amigos/<str:nick_amigo>', views.modificar_amigo),

    path('users/<str:nick_solicitado>/amigos/<str:nick_amigo>/intercambios', views.get_intercambio),
    path('capturados/', views.get_capturados),

]