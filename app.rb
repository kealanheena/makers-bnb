require 'sinatra/base'
require './lib/rental.rb'
require './lib/user.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  get "/" do
    @user = session[:user]
    @list = Rental.all
    erb :index, { :layout => :layout }
  end

  get "/sign_up" do
    erb :sign_up
  end

  post "/sign_up" do
    session[:user] = User.sign_up(username: params["Username"], email: params["Email"], password: params["Password"])
    redirect "/"
  end


  get "/log_in" do
    erb :log_in
  end

  post "/log_in" do
    session[:user] = User.log_in(email: params["Email"], password: params["Password"])
    redirect "/"
  end

  post "/log_out" do
    session.clear
    redirect '/'
  end

  # get '/rentals' do
  #   @list = Rental.all
  #   erb :rentals
  # end

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
