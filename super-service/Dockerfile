# Use the official .NET SDK image to build and publish the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy csproj files and restore as distinct layers
COPY ./src/SuperService.csproj ./src/
# COPY ./test/SuperService.UnitTests.csproj ./test/
RUN dotnet restore ./src/SuperService.csproj
# RUN dotnet restore ./test/SuperService.UnitTests.csproj

# Copy everything else and build
COPY ./src ./src
# COPY ./test ./test
# WORKDIR /app/test
# RUN dotnet test

# Publish the app
WORKDIR /app/src
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/src/out .

ENTRYPOINT ["dotnet", "SuperService.dll"]