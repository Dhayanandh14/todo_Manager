class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
    render "users/new"
  end
  def index
    render plain: User.all.map { |user| user.to_users }.join("\n") #show the user details
  end

  #check the email id and password is there in database
  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ? and password = ?", email, password_digest).first
    render plain: user.present?
  end

  #create the user given email name password
  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    users = User.new(first_name: first_name, last_name: last_name,email: email, password: password)
    if users.save
      # session[:current_user_id]=users.id
      redirect_to "/"
    else
      flash[:error] = users.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
