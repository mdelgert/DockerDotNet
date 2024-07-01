
# Deploy .NET apps on ARM single-board computers
https://learn.microsoft.com/en-us/dotnet/iot/deployment
https://devblogs.microsoft.com/dotnet/this-arm64-performance-in-dotnet-8/

```bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel STS
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$HOME/.dotnet' >> ~/.bashrc
source ~/.bashrc
dotnet --version
dotnet new console -n ArmTest
cd ArmTest
donet run
cd bin/Debug/net7.0
dotnet ArmTest.dll
dotnet publish --runtime linux-arm64 --self-contained
cd bin/Debug/net7.0/linux-arm64/publish $ chmod +x ArmTest
chmod +x ArmTest
./ArmTest
docker build -t armtest .
docker run --rm armtest
```