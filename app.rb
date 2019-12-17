require 'sinatra/base'
require './lib/rental.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  get "/" do
    @list = Rental.all
    erb :index
  end

  post "/" do
    session[:user] = User.sign_up(username: params["Username"], email: params["Email"], password: params["Password"])
    redirect "/makers-bnb"
  end

  get "/makers-bnb" do
    @user = session[:user]
    erb :makers_bnb
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Rental.add(params[:name], params[:description], params[:price])
    redirect '/'
  end

  run! if app_file == $0

end
