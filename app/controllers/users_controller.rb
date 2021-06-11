class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_users }.join("\n") #show the user details
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where("email = ? and password = ?", email, password).first
    render plain: user.present?
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    users = User.create!(name: name, email: email, password: password)
    response_text = "Yeah Your Account is Created Name: #{name} Email:#{email} Password:#{password}"
    render plain: response_text
  end
end
