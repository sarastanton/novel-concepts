require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
  end

  set :male_first_names, []
  set :female_first_names, []
  set :last_names, []

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
    settings.male_first_names = Name.male_first_names
    settings.female_first_names = Name.female_first_names
    settings.last_names = Name.last_names
    erb :name_generator
  end

  get '/generate_male_name' do
    Name.generate_name(settings.male_first_names, settings.last_names)
  end

  get '/generate_female_name' do
    Name.generate_name(settings.female_first_names, settings.last_names)
  end

  get '/saved_items' do
    erb :saved
  end

end
