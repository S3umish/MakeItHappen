class UsersController < ApplicationController

    get '/signup' do
     erb :"/users/signup"
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id]= user.id
            redirect "/missions"
        else
            @errors = user.errors.full_messages.to_sentence
            erb :"/users/signup"
        end
    end



end