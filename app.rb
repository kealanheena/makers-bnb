require 'sinatra/base'

class MakersBnB < Sinatra::Base 

  get '/' do
    erb :index
  end
  
  get '/rentals' do
    erb :rentals
  end

  run! if app_file == $0
  
end