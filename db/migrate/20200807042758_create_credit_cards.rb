class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      
      t.string :credit_card_id, null: false
      t.string :customer_id, null: false
      t.timestamps
    end
  end
end
