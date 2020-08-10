class CreditCardsController < ApplicationController
  require "payjp"

  def index
    card = CreditCard.find(8) #仮
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @credit_card = customer.cards.retrieve(card.credit_card_id)
    
  end
  def new
    @credit_card = CreditCard.new
  end

  def create
    
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @credit_card = CreditCard.new(customer_id: customer.id, credit_card_id: customer.default_card)
    
    if @credit_card.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  
  end

  def destroy
    card = CreditCard.find(8) #仮
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
  end


end
