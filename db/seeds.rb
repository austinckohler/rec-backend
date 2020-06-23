require 'rest-client'
require 'json'


def get_areas
    response = RestClient.get "https://ridb.recreation.gov/api/v1/recareas?limit=50&offset=0&state=CO,CA,OR,ID,AZ,NV,WA,MT&radius=10&lastupdated=04-15-2020&apikey=c27f931a-b90d-494c-b598-943e55922964"
    parsed_json = JSON.parse(response)

    byebug
    
    parsed_json["RECDATA"].map do |area|
            Area.create(
                RecAreaID: area["RecAreaID"],
                RecAreaName: area["RecAreaName"],
                RecAreaDescription: area["RecAreaDescription"],
                RecAreaLongitude: area["RecAreaLongitude"],
                RecAreaLatitude: area["RecAreaLatitude"],
                LastUpdatedDate: park["LastUpdatedDate"]
            )
    end
end

