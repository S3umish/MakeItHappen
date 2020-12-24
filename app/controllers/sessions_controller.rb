class SessionsController < ApplicationController
    get '/login' do
        if logged_in?
            redirect"/missions"
        end
        erb :login
    end


end