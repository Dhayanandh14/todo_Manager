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
    users = User.create!(first_name: first_name, last_name: last_name,email: email, password: password)
    redirect_to "/"
    # response_text = "Yeah Your Account is Created FirstName: #{first_name}  LastName: #{last_name}  Email:#{email}"
    # render plain: response_text
  end
end
