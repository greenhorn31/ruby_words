class ApplicationController < ActionController::API
  Mongoid.load! './config/mongoid.yml'
end
