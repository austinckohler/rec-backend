require 'rest-client'
require 'json'


def get_areas
    areas_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas?query=camp&state=CO&apikey=c27f931a-b90d-494c-b598-943e55922964"
    parsed_json = JSON.parse(areas_response)

    parsed_json["RECDATA"].map do |area|
            Area.create(
                areaID: area["RecAreaID"],
                name: area["RecAreaName"],
                description: area["RecAreaDescription"],
                directions: area["RecAreaDirections"],
                phone: area["RecAreaPhone"],
                email: area["RecAreaEmail"],
                map: area["RecAreaMapURL"],
                long: area["RecAreaLongitude"],
                lat: area["RecAreaLatitude"],
                lastUpdated: area["LastUpdatedDate"],
            )
    end
end

get_areas

def get_facilities 
    facility_response = RestClient.get "https://ridb.recreation.gov/api/v1/facilities?query=dispersed&state=CO&apikey=c27f931a-b90d-494c-b598-943e55922964"
    parsed_json = JSON.parse(facility_response)

    parsed_json["RECDATA"].map do |facility|
            Facility.create(
               
                name: facility["FacilityName"],
                description: facility["FacilityDescription"],
                directions: facility["FacilityDirections"],
                long: facility["FacilityLongitude"],
                lat: facility["FacilityLatitude"],
                lastUpdated: facility["LastUpdatedDate"],
            )  
    end
end
get_facilities
