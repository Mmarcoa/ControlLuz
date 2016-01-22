require 'test_helper'

class LightControlControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "Bienvenido | Control de Iluminación"
  end

#  test "should get on" do
#    session[:ip]='187.207.88.152'
#    get :on
#    assert_response :success
#    assert_select "title", "On | Control de Iluminación"
#  end

#  test "should get off" do
#    session[:ip]='187.207.88.152'
#    get :off
#    assert_response :success
#    assert_select "title", "Off | Control de Iluminación"
#  end
  
  test "should get responsivo" do
    get :responsivo
    assert_response :success
    assert_select "title", "Responsivo | Control de Iluminación"
  end  
end
