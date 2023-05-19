class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates  :nickname, :birth_day, :encrypted_password
    validates  :last_name, :first_name, format:{ with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
    validates  :last_name_kana, :first_name_kana, format:{ with: /\A[ァ-ヶー－]+\z/ }
  end
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}\z/ }
end
