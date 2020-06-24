class LinksController < ApplicationController


    def index
        @links = Link.all
        render json: @links
    end
    
    def show
        @link = Link.find(params[:id])
        render json: @link
    end
    
    def create
        @link = Link.create(
            title: params[:title],
            URL: params[:URL]
        )
        render json: @link

    end
    
    def update
        @link.update(link_params)
        render json: @link
    end
    
    def destroy
        @link.destroy
        redirect_to action: "index"
    end
end
