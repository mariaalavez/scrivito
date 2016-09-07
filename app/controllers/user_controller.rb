class UserController < ApplicationController
  def login
    if request.post?
      user_params = params[:user] || {}
      user = User.find(user_params[:login])
      if user && User.authenticate(user_params[:login], user_params[:password])
        flash[:notice] = "Login successful"
        self.current_user = user
        redirect_to params[:return_to].presence || "/"
      else
        flash.now[:error] = "Login failed"
      end
    end
  end

  def logout
    self.current_user = nil
    redirect_to(params[:return_to].presence || "/")
  end
end
