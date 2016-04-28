#!/bin/bash

# Set server urls and environment
dotnet run --server.urls=http://*:5000 --environment=Development

# Change ownership of created files to main user on host
# Required to prevent error: 'Project app does not have a lock file'
chown -R 1000:1000 *
