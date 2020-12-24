class SessionsController < ApplicationController
    get '/login' do
        erb :"/login"
    end

    post "/login" do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/missions"
        else
            redirect "/login"
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/"
        else
            redirect "/"
        end
    end


    
end