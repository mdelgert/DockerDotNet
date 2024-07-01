# Use SDK base image for both amd64 and arm64
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /App

# Copy everything and restore as distinct layers
COPY . ./

# Publish the app
RUN dotnet publish -c Release -o out

# Use ASP.NET runtime image
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /App
COPY --from=build-env /App/out .

# Define entrypoint
ENTRYPOINT ["dotnet", "ConsoleApp1.dll"]