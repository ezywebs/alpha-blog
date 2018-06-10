require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "John", email: "example@gmail.com", password: "pswd", admin: true)
  end
  
  test 'user successfully creates new article' do
    sign_in_as(@user, "pswd")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Article from Test", description: "This is a description of new article from the test"}
    end
    assert_template 'articles/show'
    assert_select 'div#flash_success'
  end
end