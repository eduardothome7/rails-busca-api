require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { address: @user.address, cell: @user.cell, city: @user.city, country: @user.country, date_birth: @user.date_birth, email: @user.email, gender: @user.gender, login: @user.login, name_first: @user.name_first, name_last: @user.name_last, name_title: @user.name_title, number: @user.number, password: @user.password, phone: @user.phone, picture_large: @user.picture_large, picture_medium: @user.picture_medium, picture_thumbnail: @user.picture_thumbnail, postcode: @user.postcode, state: @user.state } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, cell: @user.cell, city: @user.city, country: @user.country, date_birth: @user.date_birth, email: @user.email, gender: @user.gender, login: @user.login, name_first: @user.name_first, name_last: @user.name_last, name_title: @user.name_title, number: @user.number, password: @user.password, phone: @user.phone, picture_large: @user.picture_large, picture_medium: @user.picture_medium, picture_thumbnail: @user.picture_thumbnail, postcode: @user.postcode, state: @user.state } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
