class ItemsController < ApplicationController
  before_action :set_parent, only: [:index, :show, :search, :new]
  before_action :set_brand, only: [:index, :show, :search, :new]

  def index
    @items = Item.includes(:images).order('created_at DESC').where(buyer_id: nil)
    @random = Item.where(buyer_id: nil).order("RAND()").limit(5)
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
      redirect_to root_path, notice: "出品しました" 
    else
      render :new, notice: "出品に失敗しました" 
    end
  end
  
  def show
    @item = Item.find(params[:id])

    # 存在しない商品は取得しないようにする予定
    # if Item.find(params[:id]).present?
    #   @item = Item.find(params[:id])
    # else
    #   redirect_to root_path
    #   flash.now[:alert] = '商品がありません'
    # end

    @user = User.find(Item.find(params[:id]).seller_id)
    # @brand = Brand.find(params[:id])
    @parents = Category.order("id ASC").limit(13)
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
      redirect_to user_path(current_user.id), notice: "削除しました" 
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



  def search
    @items = Item.where.not(seller_id: current_user.id).where(buyer_id: nil).search(params[:key]).page(params[:page]).per(16)
    @search = params[:key]
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

# 詳細画面連携時の仮置き
  # def ensure_current_user
  #   item = Item.find(params[:id])
  #   if item.seller_id != current_user.id
  #     redirect_to action: :index
  #   end
  # end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_parent
    @parents = Category.order("id ASC").limit(13)
  end


  def set_brand
    @brand = Brand.order("id ASC")
  end
  
end
