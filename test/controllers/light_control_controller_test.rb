require 'test_helper'

class LightControlControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
    assert_select "title", "Bienvenido | Control de Iluminación"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Verificar | Control de Iluminación"
  end

  test "should get on" do
    get :on
    assert_response :success
    assert_select "title", "On | Control de Iluminación"
  end

  test "should get off" do
    get :off
    assert_response :success
    assert_select "title", "Off | Control de Iluminación"
  end
  


end
