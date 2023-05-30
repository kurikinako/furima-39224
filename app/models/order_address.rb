class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :sender_id, :city, :add_number, :building_name, :tel_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :sender_id, :city, :add_number
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :tel_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, sender_id: sender_id, city: city, add_number: add_number, building_name: building_name,
                   tel_number: tel_number, order_id: order.id)
  end
end
