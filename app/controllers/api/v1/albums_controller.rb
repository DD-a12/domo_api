class Api::V1::AlbumsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_album, only: [:show, :update, :destroy]

    def create
        album = Album.new album_params
        album.user = current_user
        if album.save
            render json: { id: album.id }
        else
            render json: { errors: album.errors.full_messages}, status: 422 
        end
    end

    def index 
        albums = current_user.albums.order(created_at: :desc)
        render json: albums    
    end

    def show 
        render(
            json: @album
        )
    end

    def update
        if @album.update album_params
            render json: { id: @album.id }
        else
            render json: { errors: @album.errors.full_messages}, status: 422
        end
    end

    def destroy
        @album.destroy
        render(json: { status: 200 }, status: 200)
    end

    private

    def find_album
        @album = Album.find params[:id]
    end

    def album_params
        params
        .require(:album)
        .permit(
            :title, 
            :description,
            pictures: []
        )
    end
end
