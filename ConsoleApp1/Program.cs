//https://learn.microsoft.com/en-us/dotnet/core/docker/build-container?tabs=windows&pivots=dotnet-8-0

namespace ConsoleApp1
{
    internal static class Program
    {
        private static async Task Main(string[] args)
        {
            var counter = 0;
            var max = args.Length is not 0 ? Convert.ToInt32(args[0]) : 10;

            while (max is -1 || counter < max)
            {
                Console.WriteLine($"Counter: {++counter}");
                await Task.Delay(TimeSpan.FromMilliseconds(100));
            }
        }
    }
}
