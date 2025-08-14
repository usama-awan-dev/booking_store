class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_role, only: [:new, :create]

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.build_shop(shop_params)
    if @shop.save
      redirect_to @shop, notice: "Shop created!"
    else
      render :new
    end
  end

  def show
  end

  def index
    @shops = Shop.all
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: "Shop updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, notice: "Shop deleted."
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :image)
  end

  def set_task
    @shop = Shop.find(params[:id])
  end

  def check_role
    unless current_user.owner?
      redirect_to root_path, alert: "You are not allowed to create a shop."
    end
  end
end
