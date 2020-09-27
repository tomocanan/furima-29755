class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  has_many :items
  has_many :orders
end
