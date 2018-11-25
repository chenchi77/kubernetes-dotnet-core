FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY AppWebApi/*.csproj ./AppWebApi/
RUN dotnet restore

# copy everything else and build app
COPY AppWebApi/. ./AppWebApi/
WORKDIR /app/AppWebApi
RUN dotnet publish -c Release -o out


FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
WORKDIR /app
EXPOSE 80
COPY --from=build /app/AppWebApi/out ./
ENTRYPOINT ["dotnet", "AppWebApi.dll"]