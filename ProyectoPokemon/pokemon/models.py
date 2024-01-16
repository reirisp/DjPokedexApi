# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Amigo(models.Model):
    id_usuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_usuario', primary_key=True)  # The composite primary key (id_usuario, id_amigo) found, that is not supported. The first column is selected.
    id_amigo = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_amigo', related_name='amigo_id_amigo_set')

    class Meta:
        managed = False
        db_table = 'amigo'
        unique_together = (('id_usuario', 'id_amigo'),)


class Capturado(models.Model):
    id_usuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_usuario', primary_key=True)  # The composite primary key (id_usuario, id_pokemon) found, that is not supported. The first column is selected.
    id_pokemon = models.ForeignKey('Pokemon', models.DO_NOTHING, db_column='id_pokemon')

    class Meta:
        managed = False
        db_table = 'capturado'
        unique_together = (('id_usuario', 'id_pokemon'),)


class Deseado(models.Model):
    id_usuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_usuario', primary_key=True)  # The composite primary key (id_usuario, id_pokemon) found, that is not supported. The first column is selected.
    id_pokemon = models.ForeignKey('Pokemon', models.DO_NOTHING, db_column='id_pokemon')

    class Meta:
        managed = False
        db_table = 'deseado'
        unique_together = (('id_usuario', 'id_pokemon'),)


class Favorito(models.Model):
    id_usuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_usuario', primary_key=True)  # The composite primary key (id_usuario, id_pokemon) found, that is not supported. The first column is selected.
    id_pokemon = models.ForeignKey('Pokemon', models.DO_NOTHING, db_column='id_pokemon')

    class Meta:
        managed = False
        db_table = 'favorito'
        unique_together = (('id_usuario', 'id_pokemon'),)


class Pokemon(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=255, blank=True, null=True)
    urlimagen = models.CharField(db_column='urlImagen', max_length=255, blank=True, null=True)  # Field name made lowercase.
    tipo = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pokemon'


class RegistroIntercambio(models.Model):
    id_usuario = models.OneToOneField('Usuario', models.DO_NOTHING, db_column='id_usuario', primary_key=True)  # The composite primary key (id_usuario, id_amigo, id_pokemon, id_pokemon_amigo) found, that is not supported. The first column is selected.
    id_amigo = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_amigo', related_name='registrointercambio_id_amigo_set')
    id_pokemon = models.ForeignKey(Pokemon, models.DO_NOTHING, db_column='id_pokemon')
    id_pokemon_amigo = models.ForeignKey(Pokemon, models.DO_NOTHING, db_column='id_pokemon_amigo', related_name='registrointercambio_id_pokemon_amigo_set')
    fecha = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'registro_intercambio'
        unique_together = (('id_usuario', 'id_amigo', 'id_pokemon', 'id_pokemon_amigo'),)


class Usuario(models.Model):
    id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=255, blank=True, null=True)
    apellidos = models.CharField(max_length=255, blank=True, null=True)
    nickname = models.CharField(max_length=50, blank=True, null=True)
    contraseña = models.CharField(max_length=255, blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)
    fecha = models.DateTimeField(blank=True, null=True)
    avatar = models.CharField(max_length=255, blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuario'
