class CreateItemImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :item_imgs do |t|
      t.string :img
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
