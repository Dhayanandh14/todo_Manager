class User < ActiveRecord::Base
  def to_users
    "#{id} Email #{email}"
  end
end
