require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "successful login" do
    #go to log in page
    get login_path

    #we see one input field with a type of password
    assert_select "input[type='password']", 1

    #login with credentials from fixture
    post login_path, email: "test@email.com", password: "password"
    # we are taken to parents_path
    assert_redirected_to parents_path

    #go to the page where we are redirected to
    follow_redirect!
    # page displays users name from fixture
    assert response.body.match("john")
    # check the number of rows of parents displayed on page
    number_of_parents = css_select("tbody tr").count

    # go to new parent page to add a parent
    get new_parent_path
    assert_response :success
    #we add a parent i.e. make a new parent under current teacher
    post parents_path, parent: {name: "Ms. Smith", email: "smith@email.com", student: "Will"}
    assert_redirected_to parents_path

    follow_redirect!
    assert response.body.match("john")
    assert response.body.match("Will")
    # check that number of parents went up by one
    assert_equal number_of_parents+1, css_select("tbody tr").count

    # it displays a logout link
    assert_select "a[href='#{logout_path}']"

    # we log out
    get sessions_logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_select "input[type='password']"
    assert response.body.match("Logout Successful!")
  end
end
