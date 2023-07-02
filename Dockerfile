FROM node:20

WORKDIR /app

# we will need the package.json file (for the dependencies) as well as the inder.js file (since it's the actual application used)
# COPY lets you copy in a local file or directory from your host into the Docker image itself
# specify the name of the file + how it should be called (for example same name) AKA source + destination
COPY package.json package.json
COPY index.js index.js

RUN npm install

# enables exposing the running application to the host machine (originally running inside container environment, not accessible on host machine), but also required port mapping
EXPOSE 1050

# node index.js --- to start application 
ENTRYPOINT ["node"]
CMD ["index.js"]