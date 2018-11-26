# build project use dotnet sdk
FROM microsoft/dotnet:2.1-sdk AS build
# default workdir /app
WORKDIR /app
# copy web service to /app
COPY AppWebApi/. .
# build project
RUN dotnet build
# publish web to app/publish/ folder
RUN dotnet publish -c Release -o publish

# runtime service use dotnet runtime
FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
# default workdir /app
WORKDIR /app
# container internal port
EXPOSE 80
# copy publish web files to current workdir
COPY --from=build /app/publish ./
# run command when container start
ENTRYPOINT ["dotnet", "AppWebApi.dll"]