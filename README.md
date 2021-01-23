# A Docker Compose setup for Ruby on Rails Core Development

This docker compose setup is built for automating the development environment for the Ruby on Rails framework. If you want to contribute to Rails framework and dont'really want to install all the requirements one by one, you can just use this setup to spinoff the development environment.

### Instructions

Just clone the project on your development environment and clone the Rails repository, build the images and you are ready to go!

```sh
$ git clone git@github.com:meinac/rails-dev-docker-compose.git
$ cd rails-dev-docker-compose
$ git clone git@github.com:rails/rails.git
$ make build
```

### Available make rules

You can just run `make` command in the root directory to see all the available make rules;

```
$ make

Available targets:
  * build               - Builds image
  * bundle              - Runs bundle install
  * test F=file         - Runs tests for given GEM
  * ar CONN=adapter     - Runs tests for Active Record with given adapter
  * dev                 - Opens an ash session in the container
  * down                - Removes all the containers
  * tear-down           - Removes all the containers with volumes and tears down the setup
```

### Why not the rails-dev-box though?

I love Vagrant and I used to work with it a lot in the past. But over the years, I started using Docker Compose for achieving the same results and not using the Virtual Box and Vagrant for the past 5 years or so. So, if you already have Docker Compose in your development environment and if you don't want to install the Vagrant and it's prerequisites you can just use this project.
