# NOTE: If we try to mount a host volume with the docker run command, the chown will not work.
#       And we will get the error: Project app does not have a lock file.

# docker build -t tonysneed/dotnet-aspnet .

# Don't use this: docker run -d -p 5000:5000 --name dotnet-aspnet -v $(pwd):/app tonysneed/dotnet-aspnet
# Use this instead: docker run -d -p 5000:5000 --name dotnet-aspnet tonysneed/dotnet-aspnet

FROM microsoft/dotnet-preview

MAINTAINER Anthony Sneed

COPY . /app
WORKDIR /app

RUN ["dotnet", "restore"]

# Change ownership of created files to main user on host
# Required to prevent error: 'Project app does not have a lock file'
RUN chown -R 1000:1000 project.lock.json

# Must mount volumes after changing ownership
VOLUME nuget:/root/.nuget

EXPOSE 5000

# Specify a url with a wildcard for the host name
# Note that this argument will be replaced by a manual process
ENTRYPOINT ["dotnet", "run", "server.urls=http://*:5000"]