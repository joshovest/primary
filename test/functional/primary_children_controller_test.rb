require 'test_helper'

class PrimaryChildrenControllerTest < ActionController::TestCase
  setup do
    @primary_child = primary_children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primary_children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primary_child" do
    assert_difference('PrimaryChild.count') do
      post :create, primary_child: @primary_child.attributes
    end

    assert_redirected_to primary_child_path(assigns(:primary_child))
  end

  test "should show primary_child" do
    get :show, id: @primary_child
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primary_child
    assert_response :success
  end

  test "should update primary_child" do
    put :update, id: @primary_child, primary_child: @primary_child.attributes
    assert_redirected_to primary_child_path(assigns(:primary_child))
  end

  test "should destroy primary_child" do
    assert_difference('PrimaryChild.count', -1) do
      delete :destroy, id: @primary_child
    end

    assert_redirected_to primary_children_path
  end
end
