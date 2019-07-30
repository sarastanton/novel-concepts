require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
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
    Name.populate_first_names
    Name.populate_last_names
    erb :name_generator
  end

  get '/generate_male_name' do
    Name.generate_male_name
  end

  get '/generate_female_name' do
    Name.generate_female_name
  end

  get '/saved_items' do
    erb :saved
  end

end
