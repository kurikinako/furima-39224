class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,           null: false
      t.text       :version,         null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :postage_id,      null: false
      t.integer    :sender_id,       null: false
      t.integer    :ship_date_id,    null: false
      t.integer    :price,           null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
