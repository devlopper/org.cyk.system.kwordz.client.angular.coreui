#################### Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest AS build-stage

#FROM tiangolo/node-frontend:10 as build-stage

# Node process tuning
ENV NODE_OPTIONS="--max-old-space-size=8192"

# Set the working directory
WORKDIR /app

# Copy files starting with package and ending with .json
COPY package*.json /app/

# Install all the dependencies
RUN npm config set legacy-peer-deps true
RUN npm install --force

#Copy source code
COPY ./ /app/

# Generate the build of the application
ARG configuration=production
#RUN npm run build -- --output-path=./dist/out --configuration $configuration
RUN node --max_old_space_size=8192 ./node_modules/@angular/cli/bin/ng build --output-path=./dist/out --verbose

#################### Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

# Copy the build-stage output to replace the default nginx contents.
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html

# Copy the default nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80