class CategoriesController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(category_id: params[:category_id])
    @user = User.find(@item.seller_id)
  end
  
  # 子カテゴリー表示へ
  def categories_child_show
    # 元の子カテゴリー
    child_category = Category.find(params[:category_id]).parent    
    # 孫カテゴリーリスト
    @grandchild_category_list = child_category.children
  end

  # 孫カテゴリー取得
  def categories_show
    @category_items = Item.where(category_id: params[:category_id])
    
  end

  # 一覧から子カテゴリー表示
  def category_list_to_children_list
     # 孫カテゴリー取得
    @grand_children = Category.find(params[:category_id]).children
  end

  


end
