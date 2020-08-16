class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @categories = []
      Category.all.each do |category|
        @categories << [category.name, category.id]
      end
    @brands = []
      Brand.all.each do |brand|
        @brands << [brand.name, brand.id]
      end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @items = Item.find(params[:id])
    if @items.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :explanation, :price, 
      :category_id, :status_id, 
      :delivery_fee_id, :prefecture_id,
      :days_until_shipping_id, :brand_id,
      images_attributes: [:src, :_destroy, :id]
    ).merge(seller_id: current_user.id, buyer_id: nil)
  end
end
