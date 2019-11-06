# Intro to Docker
![Build status](https://github.com/ginomessmer/intro-to-docker/workflows/CI/badge.svg)

# Tutorial
## Cheat Sheet
Before you go ahead and write your very own Dockerfile, you should get to know some of the frequently used basic commands:
- `FROM` - this is where it all starts. That's your base image. Everything you do next is based on it. In our case we use `node:alpine`.
- `WORKDIR` - this allows you to set a working directory for all commands that follow after. Why don't you use something like `/app` where we process and store all of our app's files?
- `COPY <src> <target>` - this allows you to copy files OR directories from the current local directory over to your current `WORKDIR`. Can be relative or absolute.
- `RUN ...` - you can run commands, like `RUN echo "Hello"`. You can use any commands as long as your base image supports them (in other words: as long as they exist).
- `CMD` - this is your final step. This instruction specifies which command to run as soon as you start a new container based on this image.

That's everything you need in order to Docker-ize your Angular app. Refer to Docker's and Angular's official documentation for more references and commands.

- https://angular.io/cli
- https://docs.docker.com/engine/reference/commandline/cli/

## Docker-ize your app
Take a look above for the most common commands that are required for your Dockerfile.
To begin, follow these steps:

1. Create a new file `Dockerfile` in your project's root directory.
2. Type in all Dockerfile commands that are required for your image in there. You'll start with `FROM node:alpine` and end with `CMD <todo, something that starts your Angular app>`.
   - **Hint**: for all the run commands, try to think about all the commands that you use to _build_ your Angular app _locally_ and map them as individual `RUN` instructions. It's easier than you think.
   - You can check down below for common Angular commands
3. Once you've finalized your Dockerfile, open your command line in the project directory and build your brand new Docker image: `docker build -t fancyimage .`
4. Wait until it has built the image. If you encounter build errors, your Dockerfile most likely needs fixing. But don't give up, it's all about trial and error.
5. When it has successfully built the image, you are ready to run a new container based on the image and visit your Angular site: `docker run -p 8080:4200 --rm --name fancycontainer fancyimage`
   - `-p 8080:4200` tells which ports to expose from the container to the host (`external port : internal port`).
   - `--rm` removes the container after shutdown automatically
   - `--name fancycontainer` applies the given name to the container
   - `fancyimage` your image
6. Wait until it has started your container. You can keep checking your output for more information. This might take a few couple of seconds
7. Fire up your browser and head over to `localhost:8080`
8. Enjoy and keep hacking.

You can stop the container with `docker container stop fancycontainer` or kill it entirely (stop and remove) with `docker container kill ...`.

> In case you're stuck: Check out the [sample solution](Dockerfile).

---

# Angular
This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.3.17.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
