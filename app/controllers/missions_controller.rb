class MissionsController < ApplicationController

    get "/missions" do
        @missions = current_user.missions
        # binding.pry
        # @missions = Mission.all 
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
            @errors = current_user.errors.full_messages.to_sentence
            redirect "/missions/new"
        end
    end

    get '/missions/:id' do
        @mission = Mission.find_by(id: params[:id])
        erb :'/missions/show'
    end

    get '/missions/:id/edit' do
        @mission = Mission.find_by(id: params[:id])
        if @mission.user_id == current_user.id
            erb :'/missions/edit'
        else
            redirect "/missions"
        end
    end

    patch '/missions/:id/edit' do
        @mission = Mission.find_by(id: params[:id])
        if @mission.update(params[:mission])
            redirect "/missions/#{@mission.id}"
        else
            @errors = current_user.errors.full_messages.to_sentence
            erb :"missions/show"
        end
    end

    
    

end