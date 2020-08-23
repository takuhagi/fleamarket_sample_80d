class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
    @random = Item.order("RAND()").limit(5)
    
    @parents = Category.order("id ASC").limit(13)
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
    @item = Item.find(params[:id])
    @user = User.find(Item.find(params[:id]).seller_id)
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
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end


  def edit
    @item = Item.find(params[:id])
    @brands = []
    Brand.all.each do |brand|
    @brands << [brand.name, brand.id]
    end

    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << [parent.name, parent.id]
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
    @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
    @category_grandchildren_array << grandchildren
    end
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
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
