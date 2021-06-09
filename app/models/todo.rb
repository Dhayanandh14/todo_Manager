class Todo < ActiveRecord::Base
  belongs_to:user

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed:true)
  end
end
