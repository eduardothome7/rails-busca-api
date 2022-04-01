require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Address", with: @user.address
    fill_in "Cell", with: @user.cell
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Date birth", with: @user.date_birth
    fill_in "Email", with: @user.email
    fill_in "Gender", with: @user.gender
    fill_in "Login", with: @user.login
    fill_in "Name first", with: @user.name_first
    fill_in "Name last", with: @user.name_last
    fill_in "Name title", with: @user.name_title
    fill_in "Number", with: @user.number
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "Picture large", with: @user.picture_large
    fill_in "Picture medium", with: @user.picture_medium
    fill_in "Picture thumbnail", with: @user.picture_thumbnail
    fill_in "Postcode", with: @user.postcode
    fill_in "State", with: @user.state
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Address", with: @user.address
    fill_in "Cell", with: @user.cell
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Date birth", with: @user.date_birth
    fill_in "Email", with: @user.email
    fill_in "Gender", with: @user.gender
    fill_in "Login", with: @user.login
    fill_in "Name first", with: @user.name_first
    fill_in "Name last", with: @user.name_last
    fill_in "Name title", with: @user.name_title
    fill_in "Number", with: @user.number
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "Picture large", with: @user.picture_large
    fill_in "Picture medium", with: @user.picture_medium
    fill_in "Picture thumbnail", with: @user.picture_thumbnail
    fill_in "Postcode", with: @user.postcode
    fill_in "State", with: @user.state
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
