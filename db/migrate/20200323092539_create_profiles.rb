class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string      :first_name,       null: false
      t.string      :last_name,        null: false
      t.string      :first_name_kana,  null: false
      t.string      :last_name_kana,   null: false
      t.date        :birthday,         null: false
      t.text        :icon
      t.text        :intoroduction
      t.references  :user,             foreign_key: true

      t.timestamps
    end
  end
end
