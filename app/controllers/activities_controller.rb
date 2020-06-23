class ActivitiesController < ApplicationController

    def index
        @activities = Activity.all
        render json: @activities
    end
    
    def show
        @activity = Activity.find(params[:id])
        render json: @activity, include: [:areas]
    end
    
    def create
        @activity = Activity.create(
            name: params[:ActivityName],
            description: params[:RecAreaActivityDescription],
            areaid: params[:RecAreaID],
            
            
            
            
            # FacilityID: params["FACILITY"][0]["FacilityID"]
            # facilityName: params["FACILITY"][0]["FacilityName"]
            # activityID: params["ACTIVITY"][0]["ActvityID"]
            # recAreaActivityID: params["ACTIVITY"][0]["RecAreaID"]
            # linkAreaID: params["LINK"][0]["EntityID"]
            # linkTitle: params["LINK"][0]["Title"]
            # linkURL: params["LINK"][0]["URL"]
            # mediaAreaID: params["MEDIA"][0]["EntityID"]
            # mediaURL: params["MEDIA"][0]["URL"]
        )
        render json: @activity

    end
    
    def update
        @activity.update(activity_params)
        render json: @activity
    end
    
    def destroy
        @activity.destroy
        redirect_to action: "index"
    end
end
