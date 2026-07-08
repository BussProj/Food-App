# Use an official Node base image
FROM node:22-slim

# Set the working directory
WORKDIR /app

# Install git and other potential tools needed for npm package build
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Angular CLI globally
RUN npm install -g @angular/cli@22.0.4

# Copy dependencies manifest
COPY frontend/restaurant-platform/package*.json /app/

# Expose Dev Server port
EXPOSE 4200

# CMD is overridden by docker-compose commands
CMD ["npm", "start", "--", "--host", "0.0.0.0", "--poll", "2000"]
