FactoryBot.define do
  factory :order_address do
    post_code         {'123-4567'}
    sender_id         {5}
    city              {'東京都'}
    add_number        {'1-1'}
    tel_number        {'09012345678'}
  end
end
