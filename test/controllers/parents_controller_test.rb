require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
    teacher = Teacher.create!(name: "john", email: "john@email.com", password: "test")
    session[:teacher_id] = teacher.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { email: @parent.email, name: @parent.name, student: @parent.student, teacher_id: @parent.teacher_id }
    end

    assert_redirected_to parents_path
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent
    assert_response :success
  end

  test "should update parent" do
    patch :update, id: @parent, parent: { email: @parent.email, name: @parent.name, student: @parent.student, teacher_id: @parent.teacher_id }
    assert_redirected_to parents_path
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end
end
