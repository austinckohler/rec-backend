require 'rest-client'
require 'json'


def get_areas
    response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas?state=CO&lastupdated=05-01-2020&sort=%22Name%22&apikey=c27f931a-b90d-494c-b598-943e55922964"
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
                lastUpdated: area["LastUpdatedDate"],
            )
      
            Area.all.map do |area|
                activity_response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas/#{area.areaID}/activities?limit=50&offset=0&apikey=c27f931a-b90d-494c-b598-943e55922964"
                parsed_activity = JSON.parse(activity_response)

                parsed_activity["RECDATA"].map do |activity|
                   Activity.create(
                    name: activity["ActivityName"],
                    description: activity["RecAreaActivityDescription"],
                    areaid: activity["RecAreaID"]
                   )
                end
          
                end
               
    end
end

get_areas

