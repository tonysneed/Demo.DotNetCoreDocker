# NOTE: A project.lock.json file must be included, otherwise we will get the error:
#       "Project app does not have a lock file"

# Build the image:
# docker build -t tonysneed/dotnet-aspnet .

# Create and run a container:
# docker run -d -p 5000:5000 --name dotnet-aspnet -v "${PWD}:/app" tonysneed/dotnet-aspnet

FROM microsoft/dotnet-preview

MAINTAINER Anthony Sneed

# Copy files to app directory
COPY . /app

# Set working directory
WORKDIR /app

# Restore NuGet packages
RUN ["dotnet", "restore"]

# Change ownership of created files to main user on host
#RUN chown -R 1000:1000 *
#RUN chown -R 1000:1000 ~/.nuget
#RUN chown -R 1000:1000 ~/.local/share/NuGet

# Mount shared storage volumes for NuGet packages
#VOLUME nuget:/root/.nuget
#VOLUME nuget-shared:/root/.local/share/NuGet

# Open up port
EXPOSE 5000

# Specify a url with wildcard for the host name and specify dev environment
ENTRYPOINT ["dotnet", "run", "http://*:5000", "Development"]