class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.images.new
    @brands = []
    Brand.all.each do |brand|
      @brands << [brand.name, brand.id]
    end
    
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << [parent.name, parent.id]
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

  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end
  
  def get_category_grandchildren
     @category_grandchildren = Category.find(params[:child_id]).children
  end
  


  def destroy
    @items = Item.find(params[:id])
    if @items.seller_id == current_user.id && @items.destroy
      redirect_to root_path
    # else redirect先は詳細画面
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
