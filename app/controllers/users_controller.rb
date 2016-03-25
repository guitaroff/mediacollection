class UsersController < ApplicationController
  before_action :set_user!, only: :show
  before_action :authenticate_user!

  def show
    @pictures = @user.pictures.all
    @videos = @user.videos.all
    @video = @user.videos.build
    @songs = @user.songs.all
    @song = @user.songs.build
  end

  private

  def set_user!
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: I18n.t('user.not_found')
  end
end
