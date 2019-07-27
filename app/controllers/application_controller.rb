require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash
  require 'sinatra/flash'

  configure do
    # enable :sessions
    # set :session_secret, "secret"
    # set :public_folder, 'public'
    set :views, 'app/views'
  end

  # helpers do
  # end

  get '/' do
    "Hello, world!"
  end

end
