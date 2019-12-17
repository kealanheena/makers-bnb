require 'sinatra/base'
require './lib/rental.rb'
require './lib/user.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  get "/" do
    @user = session[:user]
    erb :index
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/sign_up" do
    session[:user] = User.sign_up(username: params["Username"], email: params["Email"], password: params["Password"])
    redirect "/"
  end

  get '/rentals' do
    @list = Rental.all
    erb :rentals
  end

  run! if app_file == $0

end
