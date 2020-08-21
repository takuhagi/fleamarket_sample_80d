class UsersController < ApplicationController
  before_action :set_mypage, only: [:exhibiting, :sold]
  before_action :set_category

  def show
    @items = Item.where(buyer_id: current_user.id).page(params[:page]).per(6)
    
  end

  def exhibiting
    
  end

  def sold
    
  end
  
  def set_mypage
    @items = Item.where(seller_id: current_user.id).page(params[:page]).per(6)
  end

  def set_category
    @parents = Category.order("id ASC").limit(13)
  end
end
