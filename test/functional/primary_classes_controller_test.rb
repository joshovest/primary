require 'test_helper'

class PrimaryClassesControllerTest < ActionController::TestCase
  setup do
    @primary_class = primary_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primary_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primary_class" do
    assert_difference('PrimaryClass.count') do
      post :create, primary_class: @primary_class.attributes
    end

    assert_redirected_to primary_class_path(assigns(:primary_class))
  end

  test "should show primary_class" do
    get :show, id: @primary_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primary_class
    assert_response :success
  end

  test "should update primary_class" do
    put :update, id: @primary_class, primary_class: @primary_class.attributes
    assert_redirected_to primary_class_path(assigns(:primary_class))
  end

  test "should destroy primary_class" do
    assert_difference('PrimaryClass.count', -1) do
      delete :destroy, id: @primary_class
    end

    assert_redirected_to primary_classes_path
  end
end
