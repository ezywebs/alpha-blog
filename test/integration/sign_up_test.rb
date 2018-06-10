require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "John", email: "exampl@gmail.com", password: "pswd", admin: true)
  end
  
  test 'user signs up successfully' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: 'alex100', password: 'password', email: 'alex100@gmail.com'}
    end
    assert_template 'users/show'
  end
  
  test 'user with empty email can not sign up' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 0 do
      post_via_redirect users_path, user: {username: 'alex100', password: 'password', email: ''}
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
  end
  
  test 'user with empty username can not sign up' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 0 do
      post_via_redirect users_path, user: {username: '', password: 'password', email: 'alex100@gmail.com'}
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
  end
  
  test 'user with empty password can not sign up' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 0 do
      post_via_redirect users_path, user: {username: 'alex100', password: '', email: 'alex100@gmail.com'}
    end
    assert_template 'users/new'
    assert_select 'h2.panel-title'
  end
end