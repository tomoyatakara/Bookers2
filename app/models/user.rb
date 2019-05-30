class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image #画像を投稿する際に必要

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20}

  validates :introduction, length:{ maximum: 50}
end
