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

    post "/missions" do
        @mission = current_user.missions.build(title: params[:title], description: params[:description], startdate: params[:startdate], enddate: params[:enddate])
        if @mission.save
           redirect"/missions"
        else
            redirect "/missions/new"
        end
    end
    

end