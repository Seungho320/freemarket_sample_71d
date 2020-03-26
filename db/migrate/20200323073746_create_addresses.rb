class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string      :first_name,       null: false
      t.string      :last_name,        null: false
      t.string      :first_name_kana,  null: false
      t.string      :last_name_kana,   null: false
      t.integer     :zipcode,          null: false
      t.integer     :area_id
      t.text        :city,             null: false
      t.text        :address,          null: false
      t.text        :bulding
      t.references  :user,             foreign_key: true

      t.timestamps
    end
  end
end
