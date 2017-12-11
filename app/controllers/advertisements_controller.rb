class AdvertisementsController < ApplicationController
  def index
    @adv = Advertisement.all
  end

  def new
    @adv = Advertisement.new
  end

  def create
    @adv = Advertisement.new(adv_params)
    if @adv.save
      redirect_to @adv
    else
      render 'new'
    end
  end

  def edit
    @adv = Advertisement.find(params[:id])
  end

  def update
    @adv = Advertisement.find(params[:id])
    if @adv.update_attributes(adv_params)
      redirect_to @adv
    else
      render 'edit'
    end
  end

  def show
    @adv = Advertisement.find(params[:id])
  end

  def destroy
    @adv = Advertisement.find(params[:id])
    @adv.destroy
    redirect_to root_path
  end

  private

  def adv_params
    params.require(:advertisement).permit(:title, :content, :email, :image)
  end
end
