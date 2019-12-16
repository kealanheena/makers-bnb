require 'sinatra/base'
require './lib/rental.rb'

class MakersBnB < Sinatra::Base 

  get '/' do
    erb :index
  end
  
  get '/rentals' do
    @list = Rental.all
    erb :rentals
  end

  run! if app_file == $0
  
end