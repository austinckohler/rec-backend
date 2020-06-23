require 'rest-client'
require 'json'


def get_areas
    response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas?limit=50&offset=0&full=true&state=CO&lastupdated=05%2F01%2F2020&sort=%22Name%22&apikey=c27f931a-b90d-494c-b598-943e55922964"
    parsed_json = JSON.parse(response)

    
    
    parsed_json["RECDATA"].map do |area|
            Area.create(
                areaID: area["RecAreaID"],
                name: area["RecAreaName"],
                description: area["RecAreaDescription"],
                directions: area["RecAreaDirections"],
                phone: area["RecAreaPhone"],
                email: area["RecAreaEmail"],
                long: area["RecAreaLongitude"],
                lat: area["RecAreaLatitude"],
                lastUpdated: area["LastUpdatedDate"]      
            )
    end

    if !Area.all.nil?
        Area.all.map do |area|
            facility_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas/#{area.areaID}/facilities?query=campground&limit=50&offset=0&full=true&state=CO&sort=%22Name%22&apikey=c27f931a-b90d-494c-b598-943e55922964"
        parsed_facility = JSON.parse(facility_response)

        parsed_facility["RECDATA"].map do |facility|
                Facility.create(
                    facilityID: facility["FacilityID"],
                    recAreaID: facility["ParentRecAreaID"],
                    name: facility["FacilityName"],
                    description: facility["FacilityDescription"],
                    directions: facility["FacilityDirections"],
            )
            end
        
        end
    end

    
end
get_areas

