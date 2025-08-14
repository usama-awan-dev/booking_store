class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_shop
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = @shop.products.new
  end

  def edit
  end

  def create
    
    # debugger
  @product = @shop.products.new(product_params)
    if @product.save
      # redirect_to @product, notice: "Product created!"
      redirect_to shop_product_path(@shop, @product), notice: "Product created!"

      # redirect_to @shop, notice: "Product created!"

    else
      render :new
    end
  end

  def update
  if @product.update(product_params)
    redirect_to shop_product_path(@shop, @product), notice: "Product updated successfully"
  else
    render :edit
  end
end

  def destroy
    @product.destroy!
  end

  private


  #find shop in params
   def set_shop
    @shop = Shop.find(params[:shop_id])
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
