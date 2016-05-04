# NOTE: A project.lock.json file must be included, otherwise you will get the following error:
#       Project app does not have a lock file

# Build the image:
# docker build -t tonysneed/dotnet-helloweb .

# Create and run a container:
# docker run -d -p 5000:5000 --name dotnet-aspnet -v "${PWD}:/app" tonysneed/dotnet-helloweb

FROM tonysneed/dotnet-preview:1.0.0-rc2-002659

MAINTAINER Anthony Sneed

# Copy files to app directory
COPY . /app

# Set working directory
WORKDIR /app

# Restore NuGet packages
RUN ["dotnet", "restore"]

# Open up port
EXPOSE 5000

# Specify a url with wildcard for the host name and specify dev environment
# TODO: Replace with environment variables
ENTRYPOINT ["dotnet", "run", "http://*:5000", "Development"]