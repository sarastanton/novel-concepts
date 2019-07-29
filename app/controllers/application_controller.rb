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
    erb :index
  end

  get '/plot_generator' do
    erb :plot_generator
  end

  get '/generate_plot' do
    Plot.generate_plot
  end

  get '/name_generator' do
    erb :name_generator
  end

  get '/saved_items' do
    erb :saved
  end

end
