class User < ApplicationRecord
  has_secure_password
  validates_length_of :password,
                      minimum: 12,
                      on: [:create, :update],
                      allow_nil: true
  validates_format_of :email, with:
                      /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true
end
