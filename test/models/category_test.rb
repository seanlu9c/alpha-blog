require 'test_helper'


## TDD : test-driven-development 

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    # assertion  
    assert @category.valid?     # pass if can instantiate >> create new table category
  end
  
  
  ## way to add validations ::
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?   # pass if assert that name is invalid >> add validation on name
  end
  
  test "name should be unique" do  ## no name be the same
    @category.save
    
    # the same Sports category, should fail
    category2 = Category.new(name: "sports")
    assert_not category2.valid?   # pass if assert that same category cannot instantiate >> add validate_uniqueness
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?   #pass if fail to assert category has valid length >> but length validatin is not there, so create

    ## validation not there: by msg: "Expected true to be nil or false"

  end
  
  test "name should not be too short" do
    @category.name = "aa" 
    assert_not @category.valid?
    
  end
  
  
end