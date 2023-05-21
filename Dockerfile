FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

ENV ASPNETCORE_URLS=http://+:5000

WORKDIR /src
COPY ["DockerComposeExample.csproj", ""]
RUN dotnet restore "./DockerComposeExample.csproj"
COPY . .

WORKDIR "/src/."
RUN dotnet build "DockerComposeExample.csproj" -c Release -o /app/build
RUN dotnet publish "DockerComposeExample.csproj" -c Release -o /app/publish

WORKDIR /app/publish
ENTRYPOINT ["dotnet", "DockerComposeExample.dll"]