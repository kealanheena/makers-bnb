require 'sinatra/base'
require './lib/rental.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  get "/" do
    @list = Rental.all
    erb :index, { :layout => :layout }
  end

  post "/" do
    session[:user] = User.sign_up(username: params["Username"], email: params["Email"], password: params["Password"])
    redirect "/makers-bnb"
  end

  get "/makers-bnb" do
    @user = session[:user]
    erb :makers_bnb, { :layout => :layout }
  end

  get '/new' do
    erb :new, { :layout => :layout }
  end

  post '/new' do
    Rental.add(params[:name], params[:description], params[:price])
    redirect '/'
  end

  get '/rental/confirmation' do
    erb :confirmation
  end

  get '/rental/:id' do
    @rental = Rental.rental_details(params[:id])
    erb :rental
  end

 

  run! if app_file == $0

end
