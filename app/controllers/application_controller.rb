require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "top_secret_session"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

end
