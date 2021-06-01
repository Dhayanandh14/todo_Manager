class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_users }.join("\n") #show the user details
  end

  #check the email id and password is there in database
  def login
    email = params[:email]
    password = params[:password]
    checkmail = User.find_by(email: email) ? true : false
    checkpass = User.find_by(password: password) ? true : false
    if checkmail && checkpass
      render plain: "true"
    else
      render plain: "false"
    end
  end

  #create the user given email name password
  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    users = User.create!(name: name, email: email, password: password)
    response_text = "Yeah Your Account is Created Name: #{name} Email:#{email} Password:#{password}"
    render plain: response_text
  end
end
