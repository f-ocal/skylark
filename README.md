#Skylark

[![Build Status](https://travis-ci.org/f-ocal/skylark.svg?branch=master)](https://travis-ci.org/f-ocal/skylark)

##What is it?
Skylark is an application to share your georeferenced satellite and aerial imagery. It hosts a web map service that allows a registered user to upload and overlay their images for anyone to view. Images must be GeoTiff format and be less than 1GB in size. If logged in, a user can up-vote images they like.

This app was created as a final project at Dev BootCamp over one week during February 2016. It provides an opportunity to show off imagery-based maps and enhance our collective understanding of our delicate planet.

##Technologies:
* Ruby
* Rails
* PostgreSQL
* Javascript
* JQuery
* HTML5
* CSS3
* Bootstrap
* MapBox JS API
* MapBox Upload API
* Amazon Web Services
* GDAL
* Heroku
* Travis

##Authors:
* Karla King
* Fatma Ocal
* Natasha Thapliyal
* Shawn Spears
* Micheal Whelpley

##To run locally via the command line:

1. git clone https://github.com/f-ocal/skylark.git
2. cd skylark
3. bundle install
4. rake db:create
5. rake db:migrate
6. rake db:seed
7. rails server
8. http://localhost:3000/

### Deployed @ http://skylarkearth.herokuapp.com/
