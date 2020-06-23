class AreasController < ApplicationController

    # before_action :find_area_by_id, only: [:show, :update, :destroy]

    def index
        @areas = Area.all
        render json: @areas
    end
    
    def show
        @area = Area.find(params[:id])
        render json: @area, include: [:activities]
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
