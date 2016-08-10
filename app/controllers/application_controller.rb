class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # http_basic_authenticate_with :name => 'foo',
  #                              :password => 'bar',
  #                              :only => [:update, :create]
  
  USERS = {"admin" => "password"}

  before_action :authenticate_user, only: [:create, :update, :destroy]
 
  #skip_filter :authenticate_user, :only => :show

  private
  # def authenticate_user
  #   authenticate_or_request_with_http_basic('Message to User') do |username, password|
  #     username == 'admin' && password == 'password'
  #   end
  # end
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

end
