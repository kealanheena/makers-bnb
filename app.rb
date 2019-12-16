require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get "/" do
    erb :index
  end

  post "/" do
    redirect "/makers-bnb"
  end

  get "/makers-bnb" do
    "Welcome JDTest!"
  end

  run! if app_file == $0

end
