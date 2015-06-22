require 'tor/hidden-service'
HIDDEN_SERVICE = Tor::HiddenService.new(
  private_key: OpenSSL::PKey::RSA.generate(1024).to_pem,
  server_port: ENV['PORT'] || 5000
)
HIDDEN_SERVICE.start

require 'sinatra'

get '/' do
  slim <<EOF
    doctype html
    html
      head
        title Heroku Hidden Service
      body
        h1 Heroku Hidden Service
        p
          'This is a hidden service running on Heroku at 
          a href="http://#{HIDDEN_SERVICE.hostname}" = HIDDEN_SERVICE.hostname
        p
          'Github: 
          a href="https://github.com/warrenguy/heroku-sinatra-hidden-service" warrenguy/heroku-sinatra-hidden-service
EOF
end

run Sinatra::Application
