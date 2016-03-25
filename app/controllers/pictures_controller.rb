class PicturesController < ApplicationController
  before_action :set_picture!, only: [:show, :destroy]
  before_action :authenticate_user!

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to user_path(current_user)
    else
      render 'users/show'
    end
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_picture!
    @picture = Picture.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: I18n.t('picture.not_found')
  end

  def picture_params
    params.require(:picture).permit(:image)
  end
end
