class Api::SongsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs.all

    render json: @songs
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find params[:id]

    render json: @song
  end
end