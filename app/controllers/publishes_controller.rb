class PublishesController < ApplicationController

     def index
        @publishes = Publish.all
        render json: @publishes
    end
    
    def show
        @publish = Publish.find(params[:id])
        render json: @publish, include: [:areas]
    end
    
    def create
        @publish = Publish.create(
            title: params[:title],
            URL: params[:URL],
            areaid: params[:EntityID],
        )
        render json: @publish

    end
    
    def update
        @publish.update(publish_params)
        render json: @publish
    end
    
    def destroy
        @publish.destroy
        redirect_to action: "index"
    end
end
