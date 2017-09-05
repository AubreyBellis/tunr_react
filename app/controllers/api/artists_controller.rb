class Api::ArtistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.all
    render json: {
      artist: @artist,
      songs: @songs
    }
  end

  def create
    @artist = Artist.new artist_params

    if @artist.save
      render json: @artist
    else
      render json: {
        message: 'Error when creating Artist'
      }
    end
  end

  def update
    @artist = Artist.find params[:id]

    if @artist.update(artist_params)
      render json: @artist
    else
      render json: {
        message: 'Error when updating Artist'
      }
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    render json: {
      message: 'Artist successfully destroyed'
    }
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end