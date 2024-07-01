# Define variables
$imageName = "console-v1"
$containerName = "console1"
$dockerfilePath = "."

# Function to check if a container exists
function Test-ContainerExists {
    param (
        [string]$containerName
    )
    $container = docker ps -a --filter "name=$containerName" --format "{{.Names}}"
    return $container -eq $containerName
}

# Check if the container exists and remove it if it does
if (Test-ContainerExists -containerName $containerName) {
    Write-Host "Container $containerName exists. Removing it..."
    docker rm -f $containerName
    Write-Host "Container $containerName removed."
} else {
    Write-Host "Container $containerName does not exist. No need to remove."
}

# Build the Docker image
Write-Host "Building Docker image and tagging it as $imageName..."
docker build -t $imageName $dockerfilePath
Write-Host "Docker image $imageName built and tagged."

# Create a new container from the image
Write-Host "Creating a new container named $containerName from the $imageName image..."
docker create --name $containerName $imageName
#docker run -d --name $containerName $imageName
Write-Host "Container $containerName created and started."

