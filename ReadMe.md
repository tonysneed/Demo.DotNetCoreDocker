# DotNet Core Docker Demo

1. First install the Docker toolbox 

2. Build an image based on the latest .NET CLI bits, run the following docker command:

    ```
    docker-compose up
    ```

3. Open a browser: `http://192.168.99.100:5000`
  - You should see: **Hell World!**
  
-----

Note that there is an error if a project.lock.json file is not present: **Project app does not have a lock file**
  - This error takes place even though `dotnet restore` produces a lock file.
  - As a workaround, create the lock file by restoring packages locally.
