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
