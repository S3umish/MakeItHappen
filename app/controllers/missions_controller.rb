class MissionsController < ApplicationController

    get "/missions" do
        # @missions = current_user.missions
        @missions = Mission.all 
        erb :"/missions/index"
    end

    get "/missions/new" do
        if logged_in?
            erb :"/missions/new"
        else
            flash[:error] = "You must log in to create a new mission."
            redirect "/"
        end
    end

    post "/missions" do
        mission = current_user.missions.build(title: params[:title], description: params[:description], startdate: params[:startdate], enddate: params[:enddate])
        if mission.save
            flash[:message] = "Created Mission Successfully."
            redirect"/missions"
        else
            @errors = mission.errors.full_messages.to_sentence
            flash[:error] = "Mission creation failed: Please fill out Title and Description to create mission."
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
            flash[:error] = "You are not authorized to edit this mission."
            redirect "/missions"
        end
    end

    patch '/missions/:id/edit' do
        @mission = Mission.find_by(id: params[:id])
        if @mission.update(params[:mission])
            flash[:message] = "Updated Mission Successfully."
            redirect "/missions/#{@mission.id}"
        else
            erb :"missions/show"
        end
    end

    delete '/missions/:id/delete' do
        @mission = Mission.find_by(id: params[:id]) 
        if @mission && @mission.user == current_user
           @mission.destroy
           flash[:message] = "Deleted Mission Successfully."
           redirect "/missions"
        else
            redirect to "/" 
        end
    end 
end