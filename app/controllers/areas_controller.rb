class AreasController < ApplicationController

    # before_action :find_area_by_id, only: [:show, :update, :destroy]

    def index
        @areas = Area.all
        render json: @areas, include: [:activities, :links, :publishes]
    end
    
    def show
        @area = Area.find(params[:id])
        render json: @area, include: [:activities, :links, :publishes]
    end
    
    def create
        @area = Area.create(
            areaID: params[:RecAreaID],
            name: params[:RecAreaName],
            description: params[:RecAreaDescription],
            phone: params[:RecAreaPhone],
            email: params[:RecAreaEmail],
            long: params[:RecAreaLongitude],
            lat: params[:RecAreaLatitude],
            lastUpdated: params[:LastUpdatedDate],
        )
        render json: @area

    end
    
    def update
        @area.update(area_params)
        render json: @area
    end
    
    def destroy
        @area.destroy
        redirect_to action: "index"
    end

    # private 

    # def area_params
    #     params.require(:area).permit(:RecAreaID, :RecAreaName, :RecAreaDescription, :RecAreaLongitude, :RecAreaLatitude, :LastUpdatedDate)
    # end

    # def find_area_by_id
    #     @area = Area.find(params[:id])
    # end
end
