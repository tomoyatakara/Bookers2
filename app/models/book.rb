class Book < ApplicationRecord

	belongs_to :user

	validates :title, presence: true, uniqueness: true, length: {minimum: 1, maximum: 200}

	validates :body, presence: true, uniqueness: true, length: {minimum: 1, maximum: 200}
end
