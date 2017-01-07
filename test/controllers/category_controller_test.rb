require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
  end
  
  test 'should get categories index' do
    get :index                ## RuntimeError: @controller is nil: >> create categories_controller.rb
                          ## ActionController::UrlGenerationError: No route matches {:action=>"new", :controller=>"categories"}
                          ## >> add resources in routes.rb
    assert_response :success
                          ## AbstractController::ActionNotFound: The action 'index' could not be found for CategoriesControllerTest
                          ## >> add actions
                          ## ActionView::MissingTemplate: Missing template categories/index, application/index ...
                          ## >> add VIEWS: new,index,show.html.erb
                          ## test = pass !!
  end
  
  test 'should get new' do
    get :new
    assert_response :success
    
  end
  
  test 'should get show' do   ## requires setup
    get(:show, {'id' => @category.id})
    assert_response :success
    
  end
  
  
end