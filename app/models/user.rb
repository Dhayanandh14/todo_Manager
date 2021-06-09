class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_users
    "#{id} Email #{email} Password #{password}"#show the user details
  end
end
