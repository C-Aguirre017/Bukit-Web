require 'test_helper'

class PinsControllerTest < ActionController::TestCase
  setup do
    @pin = pins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pin" do
    assert_difference('Pin.count') do
      post :create, pin: { course_id: @pin.course_id, description: @pin.description, duration: @pin.duration, faculty: @pin.faculty, help_type: @pin.help_type, latitude: @pin.latitude, longitude: @pin.longitude, price: @pin.price, publication: @pin.publication, realization: @pin.realization, title: @pin.title, user_id: @pin.user_id }
    end

    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should show pin" do
    get :show, id: @pin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pin
    assert_response :success
  end

  test "should update pin" do
    patch :update, id: @pin, pin: { course_id: @pin.course_id, description: @pin.description, duration: @pin.duration, faculty: @pin.faculty, help_type: @pin.help_type, latitude: @pin.latitude, longitude: @pin.longitude, price: @pin.price, publication: @pin.publication, realization: @pin.realization, title: @pin.title, user_id: @pin.user_id }
    assert_redirected_to pin_path(assigns(:pin))
  end

  test "should destroy pin" do
    assert_difference('Pin.count', -1) do
      delete :destroy, id: @pin
    end

    assert_redirected_to pins_path
  end
end
