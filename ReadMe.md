# DotNet Core Docker Demo

1. First install **Docker Toolbox**: https://www.docker.com/products/docker-toolbox

2. Build an image based on the latest .NET CLI bits

    ```
    cd Demo.DotNetCoreDocker
    docker build -t tonysneed/dotnet-helloweb .
    ```

3. Create and run a Docker container based on the image

    ```
    docker run -d -p 5000:5000 --name dotnet-helloweb -v "${PWD}:/app" tonysneed/dotnet-helloweb
    ```

4. Open a browser: `http://192.168.99.100:5000`
  - You should see: **Hello World!**
  
5. Open a browser: `http://192.168.99.100:5000/hello.html`
  - You should see: **Hello from ASP.NET Core!**
  - Change the message in wwwroot/hello.html
  - Refresh the browser to see the updated message
  
  
