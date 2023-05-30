class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates  :nickname, :birth_day
    validates  :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates  :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}\z/ }

  has_many :items
  has_many :orders
end
