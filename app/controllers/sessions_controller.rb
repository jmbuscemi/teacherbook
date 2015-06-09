class SessionsController < ApplicationController
  def login
    if request.post?
      user = Teacher.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        redirect_to parents_path, notice: "Login Successul!"
      else
        flash.now[:notice] = "Invalid username/password"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    redirect_to logins_login_path, notice: "Logout Successful!"
  end
end
