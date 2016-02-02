require 'test_helper'

class SubmerchantsControllerTest < ActionController::TestCase
  setup do
    @submerchant = submerchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submerchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submerchant" do
    assert_difference('Submerchant.count') do
      post :create, submerchant: {  }
    end

    assert_redirected_to submerchant_path(assigns(:submerchant))
  end

  test "should show submerchant" do
    get :show, id: @submerchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submerchant
    assert_response :success
  end

  test "should update submerchant" do
    patch :update, id: @submerchant, submerchant: {  }
    assert_redirected_to submerchant_path(assigns(:submerchant))
  end

  test "should destroy submerchant" do
    assert_difference('Submerchant.count', -1) do
      delete :destroy, id: @submerchant
    end

    assert_redirected_to submerchants_path
  end
end
