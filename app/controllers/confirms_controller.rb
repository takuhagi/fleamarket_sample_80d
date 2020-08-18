class ConfirmsController < ApplicationController
  require "payjp"
  before_action :set_card
  

  def index
    
  end

  def show
    if @card.blank?
      redirect_to root_path
    else
      @item = Item.find(params[:id])
      @user = Profile.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @credit_card = customer.cards.retrieve(@card.credit_card_id)
    end
  end

  def pay
    @item = Item.find(params[:confirm_id])
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if @item.delivery_fee_id == (1)
      Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        card: @card.credit_card_id,
        :currency => 'jpy',
      )
    else
      
      price = @item.price
      postage = 500
      Payjp::Charge.create(
        amount: price + postage,
        customer: @card.customer_id,
        card: @card.credit_card_id,
        :currency => 'jpy',
      )
    end
    

    if @item.update(buyer_id: current_user.id)
      redirect_to root_path
    else
      redirect_to action: "pay"
    end
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end
  

  
end
