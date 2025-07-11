FROM python:3.10-slim

WORKDIR /app

# Instala dependencias del sistema (Tesseract para OCR y Poppler para PDF)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    tesseract-ocr \
    tesseract-ocr-spa \
    tesseract-ocr-eng \
    poppler-utils \
    ghostscript \
    libmagic1 && \  # Necesario para python-magic
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el proyecto
COPY . .

# Variables de entorno
ENV PYTHONUNBUFFERED=1
ENV PORT=8000
ENV TESSERACT_CMD=/usr/bin/tesseract
ENV PYTHONPATH=/app

# Puerto expuesto
EXPOSE $PORT

# Comando de inicio
CMD ["gunicorn", "titanio2.wsgi:application", "--bind", "0.0.0.0:$PORT"]