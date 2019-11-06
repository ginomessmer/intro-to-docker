# --- Build Stage
FROM node:10.13-alpine
# ENV NODE_ENV production

WORKDIR /usr/src/app

RUN npm install -g @angular/cli

COPY . .

RUN npm install --silent
RUN ng build

EXPOSE 4200

CMD ng serve

# --- TODO: Runtime Stage