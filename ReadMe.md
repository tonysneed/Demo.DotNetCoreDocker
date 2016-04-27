# DotNet Core Docker Demo

1. First install **Docker Toolbox**: https://www.docker.com/products/docker-toolbox

2. Build an image based on the latest .NET CLI bits

    ```
    cd Demo.DotNetCoreDocker
    docker build -t tonysneed/dotnet-aspnet .
    ```

3. Create and run a Docker container based on the image

    ```
    docker run -d -p 5000:5000 --name dotnet-aspnet tonysneed/dotnet-aspnet
    ```

4. Open a browser: `http://192.168.99.100:5000`
  - You should see: **Hello World!**
  

-----

NOTE: The Dockerfile runs a `chown` command to change ownership of the project.lock.json file
  - This is to prevent the following error: 'Project app does not have a lock file'
  - Mounting volumes must take place *after* running the `chown` command
