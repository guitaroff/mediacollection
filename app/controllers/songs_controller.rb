class SongsController < ApplicationController
  before_action :set_song!, only: :destroy
  before_action :authenticate_user!

  def create
    @song = current_user.songs.build(song_params)
    if @song.save
      redirect_to user_path(current_user)
    else
      @pictures = current_user.pictures.all
      @picture = current_user.pictures.build
      @videos = current_user.videos.all
      @video = current_user.videos.build
      @songs = current_user.songs.all
      render 'users/show'
    end
  end

  def destroy
    @song.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_song!
    @song = Song.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: I18n.t('form.find_error')
  end

  def song_params
    params.require(:song).permit(:title, :link)
  end
end
