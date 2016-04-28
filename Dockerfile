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

VOLUME nuget:/root/.nuget

EXPOSE 5000

COPY ./dotnet-run.sh /
RUN chmod +x /dotnet-run.sh
ENTRYPOINT ["/dotnet-run.sh"]