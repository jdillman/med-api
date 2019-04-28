require 'test_helper'

class VisitItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visit_item = visit_items(:one)
  end

  test "should get index" do
    get visit_items_url, as: :json
    assert_response :success
  end

  test "should create visit_item" do
    assert_difference('VisitItem.count') do
      post visit_items_url, params: { visit_item: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show visit_item" do
    get visit_item_url(@visit_item), as: :json
    assert_response :success
  end

  test "should update visit_item" do
    patch visit_item_url(@visit_item), params: { visit_item: {  } }, as: :json
    assert_response 200
  end

  test "should destroy visit_item" do
    assert_difference('VisitItem.count', -1) do
      delete visit_item_url(@visit_item), as: :json
    end

    assert_response 204
  end
end
