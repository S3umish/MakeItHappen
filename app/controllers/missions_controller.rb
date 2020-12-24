class MissionsController < ApplicationController

    get "/missions" do
        @missions = Mission.all 
        erb :"/missions/index"
    end
    

end