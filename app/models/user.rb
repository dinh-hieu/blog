class User < ApplicationRecord
  has_secure_password
  has_many :microposts
  validates :fullname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/,message: "email is valid" }
  validates :password, presence: true

  def self.search(search)
    if search
      where('email LIKE ?', "%#{search}%")
    else
      find(:all)
    end
  end
end
