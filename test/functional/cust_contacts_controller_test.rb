require 'test_helper'

class CustContactsControllerTest < ActionController::TestCase
  setup do
    @cust_contact = cust_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cust_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cust_contact" do
    assert_difference('CustContact.count') do
      post :create, :cust_contact => { :customer_id => @cust_contact.customer_id, :name => @cust_contact.name, :phone => @cust_contact.phone, :primary => @cust_contact.primary }
    end

    assert_redirected_to cust_contact_path(assigns(:cust_contact))
  end

  test "should show cust_contact" do
    get :show, :id => @cust_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cust_contact
    assert_response :success
  end

  test "should update cust_contact" do
    put :update, :id => @cust_contact, :cust_contact => { :customer_id => @cust_contact.customer_id, :name => @cust_contact.name, :phone => @cust_contact.phone, :primary => @cust_contact.primary }
    assert_redirected_to cust_contact_path(assigns(:cust_contact))
  end

  test "should destroy cust_contact" do
    assert_difference('CustContact.count', -1) do
      delete :destroy, :id => @cust_contact
    end

    assert_redirected_to cust_contacts_path
  end
end
