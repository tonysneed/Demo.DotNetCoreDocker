# NOTE: Project.lock.json must be included to prevent error: Project app does not have a lock file.

# docker build -t tonysneed/dotnet-aspnet .

# docker run -d -p 5000:5000 --name dotnet-aspnet -v $(pwd):/app tonysneed/dotnet-aspnet

FROM microsoft/dotnet-preview

MAINTAINER Anthony Sneed

COPY . /app

WORKDIR /app

RUN ["dotnet", "restore"]

EXPOSE 5000

ENTRYPOINT ["dotnet", "run", "server.urls=http://*:5000"]