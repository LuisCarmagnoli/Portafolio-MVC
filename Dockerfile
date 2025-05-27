# Etapa 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copiamos todo el código fuente
COPY . ./

# Restauramos dependencias
RUN dotnet restore

# Publicamos en modo Release
RUN dotnet publish -c Release -o /out

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copiamos la app publicada desde la etapa anterior
COPY --from=build /out .

# Render expone el puerto como variable de entorno
ENV ASPNETCORE_URLS=http://+:$PORT

# Puerto por defecto
EXPOSE 5000

# Comando para iniciar la app
ENTRYPOINT ["dotnet", "Portafolio-MVC.dll"]
