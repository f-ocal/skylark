# config/puma.rb
threads 2,16
workers 2
preload_app!
port 3000
