class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :first_name_kana, null: false
      t.string :family_name_kana, null: false
      t.integer :post_code, null: false, null: false
      t.integer :prefecture_id,foreign_key: true
      t.string :city, null: false
      t.string :address_number, null: false
      t.string :building, null: false
      t.date :birth_date, null: false
      t.integer :phone, limit: 6
      t.references :user, foreign_key: true
      t.string :introduction
      t.timestamps
    end
  end
end
