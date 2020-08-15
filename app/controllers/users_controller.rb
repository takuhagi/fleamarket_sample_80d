class UsersController < ApplicationController
  before_action :set_mypage, only: [:show, :exhibiting, :sold]

  def show
    
  end

  def exhibiting
    
  end

  def sold
    
  end

  def set_mypage
    @items = Item.all
    @images = Image.all
  end
end
