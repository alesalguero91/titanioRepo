from django.urls import path
from .views import subir_archivo_view


urlpatterns = [
    path('', subir_archivo_view, name='subir_archivo'),
  
]

