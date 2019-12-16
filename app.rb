require 'sinatra/base'

class MakersBnB < Sinatra::Base

  enable :sessions

  get "/" do
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

  run! if app_file == $0

end
