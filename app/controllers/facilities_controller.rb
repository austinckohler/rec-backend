class FacilitiesController < ApplicationController

    def index
        @facilities = Facility.all
        render json: @facilities
    end
    
    def show
        @facility = facility.find(params[:id])
        render json: @facility, include: [:areas]
    end
    
    def create
        @facility = Facility.create(
            RecAreaID: params[:RecAreaID],
            RecAreaName: params[:RecAreaName],
            RecAreaDescription: params[:RecAreaDescription],
            RecAreaLongitude: params[:RecAreaLongitude],
            RecAreaLatitude: params[:RecAreaLatitude],
            LastUpdatedDate: params[:LastUpdatedDate]
        )
        render json: @facility
    end
    
    def update
        @facility.update(facility_params)
        render json: @facility
    end
    
    def destroy
        @facility.destroy
        redirect_to action: "index"
    end

end
