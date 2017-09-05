class Api::SongsController < ApplicationController
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
def create
    @song = Song.new song_params

    if @song.save
      render json: @song
    else
      render json: {
        message: 'Error when creating Song'
      }
    end
  end

  def update
    @song = Song.find params[:id]

    if @song.update(song_params)
      render json: @song
    else
      render json: {
        message: 'Error when updating Song'
      }
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    render json: {
      message: 'Song successfully destroyed'
    }
  end

  private

  def song_params
    params.require(:song).permit(:title, :album, :photo_url, :artist)
  end
end
  
