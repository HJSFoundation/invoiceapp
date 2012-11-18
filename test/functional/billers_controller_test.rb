require 'test_helper'

class BillersControllerTest < ActionController::TestCase
  setup do
    @biller = billers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biller" do
    assert_difference('Biller.count') do
      post :create, :biller => { :biller_name => @biller.biller_name, :rate => @biller.rate }
    end

    assert_redirected_to biller_path(assigns(:biller))
  end

  test "should show biller" do
    get :show, :id => @biller
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @biller
    assert_response :success
  end

  test "should update biller" do
    put :update, :id => @biller, :biller => { :biller_name => @biller.biller_name, :rate => @biller.rate }
    assert_redirected_to biller_path(assigns(:biller))
  end

  test "should destroy biller" do
    assert_difference('Biller.count', -1) do
      delete :destroy, :id => @biller
    end

    assert_redirected_to billers_path
  end
end
