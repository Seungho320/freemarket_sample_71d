class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :text
      t.integer :price
      t.integer :category_id
      t.integer :brand_id
      t.integer :size_id
      t.integer :item_condition_id
      t.integer :area_id
      t.integer :send_days_id
      t.references :seller_id
      t.references :buyer_id
      t.timestamps
    end
  end
end
