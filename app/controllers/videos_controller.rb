class VideosController < ApplicationController
  before_action :set_video!, only: :destroy
  before_action :authenticate_user!

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to user_path(current_user)
    else
      @pictures = current_user.pictures.all
      @picture = current_user.pictures.build
      @videos = current_user.videos.all
      @songs = current_user.songs.all
      @song = current_user.songs.build
      render 'users/show'
    end
  end

  def destroy
    @video.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_video!
    @video = Video.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: I18n.t('form.find_error')
  end

  def video_params
    params.require(:video).permit(:link)
  end
end
