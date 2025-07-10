from django.shortcuts import render

# Create your views here.
def subir_archivo_view(request):
    return render(request, 'lectorpdf/lectorpdf.html')