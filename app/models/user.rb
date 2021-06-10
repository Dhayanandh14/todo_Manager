class User < ActiveRecord::Base
  def to_users
    "#{id} Email #{email}"#show the user details
  end
end
