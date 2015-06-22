# heroku-sinatra-hidden-service

A sample app deploying a Sinatra app as a hidden service on Heroku using the
[ruby-hidden-service](https://github.com/warrenguy/ruby-hidden-service) gem.

E.g. http://sinatra-hidden-service.herokuapp.com/

## Deployment

```
git clone https://github.com/warrenguy/heroku-sinatra-hidden-service.git
cd heroku-sinatra-hidden-service
heroku apps:create sinatra-hidden-service
heroku buildpacks:set https://github.com/heroku/heroku-buildpack-multi.git
git push heroku
```

N.B. You should change the app name to something unique, and be aware that
as the private key is generated in config.ru startup, it will change every
time the app is started. Also, it may take a minute or two for the hidden
service to become available on the Tor network after startup.
