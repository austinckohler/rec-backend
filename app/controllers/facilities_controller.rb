class FacilitiesController < ApplicationController

     def index
        @facilities = Facility.all
        render json: @facilities
    end
    
    def show
        @facility = Facility.find(params[:id])
        render json: @facility
    end
    
    def create
        @facility = Facility.create(
            name: params[:FacilityName],
            description: params[:RecAreaDescription],
            directions: params[:FacilityDirections],
            long: params[:FacilityLongitude],
            lat: params[:FacilityLatitude],
            lastUpdated: params[:LastUpdatedDate],
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

    # private 

    # def area_params
    #     params.require(:facility).permit(:RecAreaID, :RecAreaName, :RecAreaDescription, :RecAreaLongitude, :RecAreaLatitude, :LastUpdatedDate)
    # end

    # def find_area_by_id
    #     @facility = Facility.find(params[:id])
    # end
end
