class AreasController < ApplicationController

    def index
        @areas = Area.all
        render json: @areas
    end
    
    def show
        render json: @area
    end
    
    def create
        @area = Area.create(area_params)
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

    private 

    def area_params
        params.require(:area).permit(:RecAreaID, :RecAreaName, :RecAreaDescription, :RecAreaLongitude, :RecAreaLatitude, :LastUpdatedDate)
    end

    def find_area_by_id
        @area = Area.find(params[:id])
    end
end
