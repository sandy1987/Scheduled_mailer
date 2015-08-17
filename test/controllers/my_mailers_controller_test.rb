require 'test_helper'

class MyMailersControllerTest < ActionController::TestCase
  setup do
    @my_mailer = my_mailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_mailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_mailer" do
    assert_difference('MyMailer.count') do
      post :create, my_mailer: { body: @my_mailer.body, email: @my_mailer.email, schedule_time: @my_mailer.schedule_time, subject: @my_mailer.subject }
    end

    assert_redirected_to my_mailer_path(assigns(:my_mailer))
  end

  test "should show my_mailer" do
    get :show, id: @my_mailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_mailer
    assert_response :success
  end

  test "should update my_mailer" do
    patch :update, id: @my_mailer, my_mailer: { body: @my_mailer.body, email: @my_mailer.email, schedule_time: @my_mailer.schedule_time, subject: @my_mailer.subject }
    assert_redirected_to my_mailer_path(assigns(:my_mailer))
  end

  test "should destroy my_mailer" do
    assert_difference('MyMailer.count', -1) do
      delete :destroy, id: @my_mailer
    end

    assert_redirected_to my_mailers_path
  end
end
