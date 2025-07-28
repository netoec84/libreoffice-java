FROM debian:bookworm-slim

LABEL maintainer="Jose GUEVARA <jose@jewif.com>"

# Actualizar el sistema e instalar LibreOffice, Java y dependencias necesarias
RUN apt-get update && apt-get install -y \
    # LibreOffice y componentes esenciales
    libreoffice \
    # Java Runtime Environment (necesario para LibreOffice)
    default-jre-headless \
    # Librerías adicionales necesarias para un entorno sin GUI y renderizado
    libxinerama1 \
    libfontconfig1 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libgconf-2-4 \
    libxss1 \
    libasound2 \
    # Fuentes comunes que LibreOffice podría necesitar para renderizar correctamente
    fonts-dejavu \
    fonts-liberation \
    fonts-noto \
    fonts-indic \
    fonts-opensymbol \
    # Para evitar problemas con la interfaz gráfica en entornos sin X server (xvfb)
    xvfb \
    # Utilidades adicionales
    wget \
    unzip \
    # Limpiar caché de apt para reducir el tamaño de la imagen
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configurar variables de entorno para Java (si es necesario que estén disponibles globalmente)
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="$JAVA_HOME/bin:$PATH"

# Comando para verificar la instalación (opcional, útil para depuración)
CMD ["libreoffice", "--version"]