require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = teachers(:one)
    teacher = Teacher.create!(name: "john", email: "john@email.com", password: "test")
    session[:teacher_id] = teacher.id
  end
  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should get update" do
    get :update, id: @teacher
    assert_redirected_to parents_path
  end

end
