FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base_stage

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

COPY . ./app
WORKDIR /app

RUN dotnet build

WORKDIR /app/DotnetTemplate.Web

RUN npm install
RUN npm run build

#FROM mcr.microsoft.com/dotnet/aspnet:5.0


ENTRYPOINT ["dotnet","run"]



