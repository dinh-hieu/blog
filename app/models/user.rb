class User < ApplicationRecord
  has_secure_password
  has_many :microposts
  validates :fullname, presence: true
  validates :email, presence: true, format: { with: /@/,message: "email is valid" }
  validates :password, presence: true
end
