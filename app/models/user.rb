class User < ActiveRecord::Base
  has_many :todos
  validates :first_name, length: { minimum: 2 }
  validates :first_name,:email, presence: true
  has_secure_password
  # validates:email, presence: true

  def to_users
    "#{id} Email #{email}"#show the user details
  end
end
