class UsersController < ApplicationController
  

  def show
    @item = Item.all
    @image = Image.all
  end

  def exhibiting
    @item = Item.all
    @image = Image.all
    
  end

  def sold
    @item = Item.all
    @image = Image.all
  end
end
