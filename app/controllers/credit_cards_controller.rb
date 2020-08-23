class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_category, only: [:index, :new]
  before_action :set_brand, only: [:index, :new]

  def index
    
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @credit_card = customer.cards.retrieve(@card.credit_card_id)
    end
  end
  def new
    
    if @card.blank?
      @credit_card = CreditCard.new
    else
      redirect_to action: "index"
    end
  end

  def create
    
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, credit_card_id: customer.default_card)
    
    if @credit_card.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  
  end

  def destroy
    
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    
    if @card.destroy
      redirect_to root_path
    end
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_category
    @parents = Category.order("id ASC").limit(13)
  end

  def set_brand
    @brands = Brand.order("id ASC")
  end

end
