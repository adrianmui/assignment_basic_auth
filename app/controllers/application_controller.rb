class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with       :name => "Bob",
                                     :password => "password",
                                     :only => [:update, :create]
  before_action :authenticate_user, except: [:show, :index]


  private

  def authenticate_user
    authenticate_or_request_with_http_basic('message to user') do |username, password|
      username == "admin" && password == "password"
    end
  end
end
