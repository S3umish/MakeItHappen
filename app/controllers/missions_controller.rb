class MissionsController < ApplicationController

    get "/missions" do
        @missions = Mission.all 
        erb :"/missions/index"
    end

    get "/missions/new" do
        if logged_in?
            erb :"/missions/new"
        else
            redirect "/"
        end
    end
    

end