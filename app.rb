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
    @error = session[:error]
    erb :sign_up
  end

  post "/sign_up" do
    session[:user] = User.sign_up(username: params["Username"], email: params["Email"], password: params["Password"])
    if session[:user] == "Email already exists"
      session[:error] = "Email already exists"
      session[:user].clear
      redirect "/sign_up"
    elsif session[:user] == "Username already exists"
      session[:error] = "Username already exists"
      session[:user].clear
      redirect "/sign_up"
    else
      redirect "/"
    end
  end


  get "/log_in" do
    @error = session[:error]
    erb :log_in
  end

  post "/log_in" do
    session[:user] = User.authenticate(email: params["Email"], password: params["Password"])
    if session[:user]
      redirect "/"
    else
      session[:error] = true
      redirect "/log_in"
    end
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
    Rental.add(params[:name], params[:description], params[:price], params[:starting], params[:ending])
    redirect '/'
  end

  get '/rental/confirmation' do
    erb :confirmation
  end

  get '/rental/:id' do
    p 'inside the get'
    p params
    @rental = Rental.rental_details(params[:id])
    # p @rental.id
    @date_available = session[:date]
    # p @date_available
    erb :rental
  end

  post '/rental/:id' do
    p 'in the post'
    p params
    session[:date] = Rental.check_date(params[:id], params[:date])
    redirect "/rental/#{params[:id]}"
  end

  run! if app_file == $0

end
