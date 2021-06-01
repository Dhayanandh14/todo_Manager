class User < ActiveRecord::Base
  def to_users
    "#{id} Email #{email} Password #{password}"#show the user details
  end
end
