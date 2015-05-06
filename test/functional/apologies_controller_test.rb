require 'test_helper'

class ApologiesControllerTest < ActionController::TestCase
  setup do
    @apology = apologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apology" do
    assert_difference('Apology.count') do
      post :create, apology: { could_communicate_differently: @apology.could_communicate_differently, date: @apology.date, gender: @apology.gender, relationship: @apology.relationship, was_warranted: @apology.was_warranted }
    end

    assert_redirected_to apology_path(assigns(:apology))
  end

  test "should show apology" do
    get :show, id: @apology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apology
    assert_response :success
  end

  test "should update apology" do
    put :update, id: @apology, apology: { could_communicate_differently: @apology.could_communicate_differently, date: @apology.date, gender: @apology.gender, relationship: @apology.relationship, was_warranted: @apology.was_warranted }
    assert_redirected_to apology_path(assigns(:apology))
  end

  test "should destroy apology" do
    assert_difference('Apology.count', -1) do
      delete :destroy, id: @apology
    end

    assert_redirected_to apologies_path
  end
end
