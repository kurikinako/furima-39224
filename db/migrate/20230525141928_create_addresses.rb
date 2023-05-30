class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,      null: false
      t.integer    :sender_id,      null: false
      t.string     :city,           null: false
      t.string     :add_number,     null: false
      t.string     :building_name
      t.string     :tel_number,     null: false
      t.references :order,          null: false, foreign_key: true
      t.timestamps
    end
  end
end