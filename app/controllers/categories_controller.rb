class CategoriesController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where(category_id: params[:category_id]).where(buyer_id: nil)
    @user = User.find(@item.seller_id)

    @items_page = @items.where(buyer_id: nil).page(params[:page]).per(12)
  end
  
  # 子カテゴリー表示へ
  def categories_child_show
    @grandchild_category = Category.find(params[:category_id])
    child_category = Category.find(params[:category_id]).parent    
    @grandchild_category_list = child_category.children
    # ページネーション実装のため追加
    @items = Item.where(buyer_id: nil)
    @item_list = []
    @grandchild_category_list.each do |category|
      @items.where(category_id: category.id).each do |item|
        @item_list << item
      end
    end
    @list_array = Kaminari.paginate_array(@item_list).page(params[:page]).per(12)
  end

  # 孫カテゴリー取得
  def categories_show
    @grand_children = Category.find(params[:category_id])
    @category_items = Item.where(category_id: params[:category_id])
    @category_items_page = @category_items.where(buyer_id: nil).page(params[:page]).per(12)

  end

  # 一覧から子カテゴリー表示
  def category_list_to_children_list
    @grand_children = Category.find(params[:category_id]).children
    # ページネーション実装のため追加
    @items = Item.where(buyer_id: nil)
    @item_list = []
    @grand_children.each do |category|
      @items.where(category_id: category.id).where(buyer_id: nil).each do |item|
        @item_list << item
      end
    end
    @list_array = Kaminari.paginate_array(@item_list).page(params[:page]).per(12)
  end
end
