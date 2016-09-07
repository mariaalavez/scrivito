class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  protected

  def logged_in?
    session[:user].present?
  end

  def current_user
        @current_user ||= if logged_in?
            incorrect_encoding = session[:user].any? do |key, value|
                value.is_a?(String) && value.encoding.name != 'UTF-8'
            end

            if incorrect_encoding
                self.current_user = User.find(session[:user][:id])
            end

            User.new(session[:user] || {})
        end
    end

    def current_user=(user)
        @current_user = user
        session[:user] = user.nil? ? nil : user.attributes.symbolize_keys
    end
end
