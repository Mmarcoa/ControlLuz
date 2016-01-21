require 'test_helper'

class LightControlControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Bienvenido | Control de Iluminación"
  end

  test "should get on" do
    session[:ip]='187.207.19.122'
    get :on
    assert_response :success
    assert_select "title", "On | Control de Iluminación"
  end

  test "should get off" do
    session[:ip]='187.207.19.122'
    get :off
    assert_response :success
    assert_select "title", "Off | Control de Iluminación"
  end
  
end
