require 'test_helper'

class LevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_level
    assert_difference('Level.count') do
      post :create, :level => { }
    end

    assert_redirected_to level_path(assigns(:level))
  end

  def test_should_show_level
    get :show, :id => levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => levels(:one).id
    assert_response :success
  end

  def test_should_update_level
    put :update, :id => levels(:one).id, :level => { }
    assert_redirected_to level_path(assigns(:level))
  end

  def test_should_destroy_level
    assert_difference('Level.count', -1) do
      delete :destroy, :id => levels(:one).id
    end

    assert_redirected_to levels_path
  end
end
