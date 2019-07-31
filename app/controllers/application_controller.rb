require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
  end

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

end
