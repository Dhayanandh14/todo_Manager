class User < ActiveRecord::Base
  has_many :todos
  validates :first_name, length: { minimum: 2 }
  validates :first_name, :email, presence: true
  validates :email, { presence: true, uniqueness: true }
  validates :password, length: { minimum: 3 }
  has_secure_password

  # def to_users
  #   "#{id} Email #{email}" #show the user details
  # end
end
