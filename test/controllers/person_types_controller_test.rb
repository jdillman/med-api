require 'test_helper'

class PersonTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_type = person_types(:one)
  end

  test "should get index" do
    get person_types_url, as: :json
    assert_response :success
  end

  test "should create person_type" do
    assert_difference('PersonType.count') do
      post person_types_url, params: { person_type: { name: @person_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show person_type" do
    get person_type_url(@person_type), as: :json
    assert_response :success
  end

  test "should update person_type" do
    patch person_type_url(@person_type), params: { person_type: { name: @person_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy person_type" do
    assert_difference('PersonType.count', -1) do
      delete person_type_url(@person_type), as: :json
    end

    assert_response 204
  end
end
