using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace HelloWeb
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // TODO: Replace args with environment variables
            var url = args[0];
            var env = args[1];
            
            var host = new WebHostBuilder()
                        .UseKestrel()
                        .UseUrls(url)
                        .UseEnvironment(env)
                        .UseContentRoot(Directory.GetCurrentDirectory())
                        .UseStartup<Startup>()
                        .Build();
            host.Run();
        }
    }
}