# Usa Alpine Linux como base
FROM ubuntu:latest

# Actualiza los paquetes e instala las dependencias necesarias
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y maven wget tar git && \
    apt-get clean
    
# Directorio de instalación de GraalVM
ENV GRAALVM_HOME /opt/graalvm

# Descarga e instala GraalVM JDK 17 para arquitectura AArch64
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.3.0/graalvm-ce-java17-linux-amd64-21.3.0.tar.gz -O /tmp/graalvm.tar.gz && \
    tar -xzf /tmp/graalvm.tar.gz -C /opt && \
    rm /tmp/graalvm.tar.gz && \
    mv /opt/graalvm-ce-java17-21.3.0 $GRAALVM_HOME

# Configura las variables de entorno
ENV PATH $GRAALVM_HOME/bin:$PATH

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /opt/

# Comando para ejecutar la aplicación
CMD ["bash"]
