class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation ,null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_until_shipping_id, null: false
      t.references :brand, foreign_key: true

      # 出品中、売却済みの判断。user.rb実装後に使う
      t.integer :seller_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
