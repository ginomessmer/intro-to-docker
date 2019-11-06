FROM node:alpine

WORKDIR /app

RUN npm install -g --silent @angular/cli

COPY . .

RUN npm install --silent
RUN ng build

# Optional: Allows us to expose ports for containers
EXPOSE 4200 

CMD ng serve --host 0.0.0.0