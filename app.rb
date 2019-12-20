require 'sinatra/base'
require './lib/rental.rb'
require './lib/user.rb'
require './lib/booking.rb'

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
    session[:user] = User.sign_up(username: params["Username"],
      email: params["Email"], password: params["Password"])

    if session[:user] == :email_clash
      session[:error] = :email_clash
      session[:user] = nil
      redirect "/sign_up"
    elsif session[:user] == :username_clash
      session[:error] = :username_clash
      session[:user] = nil
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
    session[:user] = User.authenticate(email: params["Email"],
      password: params["Password"])

    if session[:user]
      redirect "/"
    else
      session[:error] = true
      redirect "/log_in"
    end
  end

  post "/log_out" do
    @user = session[:user]
    session.clear
    redirect '/'
  end

  get '/new' do
    @user = session[:user]
    erb :new, { :layout => :layout }
  end

  post '/new' do
    Rental.add(name: params[:name], description: params[:description],
      price: params[:price], starting: params[:starting],
      ending: params[:ending], username: session[:user].username)
    redirect '/'
  end

  get '/rental/:id' do
    @user = session[:user]
    @rental = Rental.rental_details(id: params[:id])
    @date_available = session[:check_date]
    session[:check_date] = nil
    erb :rental
  end

  post '/rental/:id' do
    session[:check_date] = Rental.check_date(id: params[:id], date: params[:date])
    session[:date] = params[:date]
    redirect "/rental/#{params[:id]}"
  end

  get '/rental/:id/confirmation' do
    @user = session[:user]
    erb :confirmation
  end

  post '/rental/:id/confirmation' do
    @rental = Rental.rental_details(id: params[:id])
    Booking.create(rental_name: @rental.name, client_username: session[:user].username, date: session[:date])
    redirect "/rental/#{params[:id]}/confirmation"
  end

  get '/requests' do
    @user = session[:user]
    @bookings_made = Booking.made(client_username: @user.username)
    @bookings_received = Booking.received(owner_username: @user.username)
    erb :requests
  end

  get '/request/:booking_id/:rental_id' do
    @rental = Rental.rental_details(id: params[:rental_id])
    @booking_id = params[:booking_id]
    erb :request_page
  end

  post '/request/:booking_id/:rental_id' do
    Booking.update_status(id: params[:booking_id], status: params[:status], rental_id: params[:rental_id])
    redirect '/requests'
  end

  run! if app_file == $0

end
