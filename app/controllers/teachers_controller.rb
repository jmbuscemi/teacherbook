class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  def edit
    @teacher = Teacher.find_by_id(session[:teacher_id])
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to parents_path, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(session[:teacher_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in?
      if Teacher.find_by_id(session[:teacher_id])
        return true
      else
        redirect_to sessions_login_path, notice: "User not logged in!"
      end
    end
end
