require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    
    # assert VIEW/UI is/getting  new page/form
    assert_template 'categories/new'
    
    
    assert_difference'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end

    # assert VIEW/UI is index page
    assert_template 'categories/index'

    # assert  index page has "sports"
    assert_match "sports", response.body
  end
  
  ## rake test
  ## AbstractController::ActionNotFound: The action 'create' could not be found for CategoriesController
  ## ActionView::MissingTemplate: Missing template categories/create, application/create with >> trying to POST
  ## >> build new category FORM
  
  ## added new.html, add @cate in controller
  ## submit @ new form:- same error
  ## ActionView::MissingTemplate: Missing template categories/create, application/create with >> trying to POST
  
  ## added create logic in controller, and test
  ## failure CreateCategoriesTest#test_get_new_category_form_and_create_category [/home/ubuntu/rails_projects/alpha-blog/test/integration/create_categories_test.rb:20]:
    # Expected /sports/ to match
  ## >> need index page
  
  
  test "invalid category submission results in failure" do
    get new_category_path
    
    # assert VIEW/UI is/getting  new page/form
    assert_template 'categories/new'
    
    
    assert_no_difference'Category.count' do
      post categories_path, category: {name: " "}
    end

    # assert VIEW/UI is NEW page
    assert_template 'categories/new'

    assert_select 'h2.panel-title' ## check exisitng of these 2 items >> error page being rendered
    assert_select 'div.panel-body'
  end
  
end