require 'rest-client'
require 'json'


def get_areas
    areas_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas?state=CO&activity=CAMPING,CLIMBING,HIKING,BIKING,WILDERNESS&lastupdated=05-01-2020&apikey=c27f931a-b90d-494c-b598-943e55922964"
    parsed_json = JSON.parse(areas_response)

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
                lastUpdated: area["LastUpdatedDate"],
            )
    
      
            Area.all.map do |area|
                activity_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas/#{area.areaID}/activities?apikey=c27f931a-b90d-494c-b598-943e55922964"
                parsed_activity = JSON.parse(activity_response)

                parsed_activity["RECDATA"].map do |activity|
                   Activity.create(
                    name: activity["ActivityName"],
                    area_id: area.id
                   )
                end
            end

            Area.all.map do |area|
                link_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas/#{area.areaID}/links?apikey=c27f931a-b90d-494c-b598-943e55922964"
                parsed_link = JSON.parse(link_response)

                parsed_link["RECDATA"].map do |link|
                   Link.create(
                    title: link["Title"],
                    URL: link["URL"],
                    area_id: area.id
                   )
                end
            end
            Area.all.map do |area|
                publish_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas/#{area.areaID}/media?apikey=c27f931a-b90d-494c-b598-943e55922964"
                parsed_publish = JSON.parse(publish_response)

                parsed_publish["RECDATA"].map do |publish|
                   Publish.create(
                    title: publish["Title"],
                    URL: publish["URL"],
                    area_id: area.id
                   )
                end
            end

    end
end

get_areas

def get_facilities 

    facility_response = RestClient.get "https://ridb.recreation.gov/api/v1/facilities?query=CAMPING,HIKING&full=false&state=CO&activity=CAMPING,CLIMBING,HIKING,&lastupdated=06-01-2020&apikey=c27f931a-b90d-494c-b598-943e55922964"
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