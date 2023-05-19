class Item < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validatest :version, presence: true
  validatest :category_id, presence: true
  validatest :condition_id, presence: true
  validatest :postage_id, presence: true
  validatest :sender_id, presence: true
  validatest :ship_date_id, presence: true
  validatest :price, presence: true

end
