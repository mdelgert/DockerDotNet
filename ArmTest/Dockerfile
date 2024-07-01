# Use the official .NET 7 SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the csproj file and restore any dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Use the official .NET 7 Runtime image for the runtime environment
FROM mcr.microsoft.com/dotnet/runtime:7.0

# Set the working directory in the container
WORKDIR /app

# Copy the built application from the previous stage
COPY --from=build /app/out .

# Define the entry point for the application
ENTRYPOINT ["dotnet", "ArmTest.dll"]
