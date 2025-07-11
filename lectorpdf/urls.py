from django.urls import path
from .views import subir_archivo_view, PDFUploadView, NotaGeneradaView,ExcelUploadView


urlpatterns = [
    path('', subir_archivo_view, name='subir_archivo'),

    path('upload-pdf/', PDFUploadView.as_view(), name='upload-pdf'),
    path('generar-nota/', NotaGeneradaView.as_view(), name='generar-nota'),
    path('procesar-excel/', ExcelUploadView.as_view(), name='procesar excel')
  
]

