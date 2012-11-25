require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, :payment => { :invoice_header => @payment.invoice_header, :payment_amount => @payment.payment_amount, :payment_date => @payment.payment_date, :payment_notes => @payment.payment_notes, :payment_type => @payment.payment_type }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, :id => @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @payment
    assert_response :success
  end

  test "should update payment" do
    put :update, :id => @payment, :payment => { :invoice_header => @payment.invoice_header, :payment_amount => @payment.payment_amount, :payment_date => @payment.payment_date, :payment_notes => @payment.payment_notes, :payment_type => @payment.payment_type }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, :id => @payment
    end

    assert_redirected_to payments_path
  end
end
