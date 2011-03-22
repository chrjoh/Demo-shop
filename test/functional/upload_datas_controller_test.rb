require 'test_helper'

class UploadDatasControllerTest < ActionController::TestCase
  setup do
    @upload_data = upload_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upload_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload_data" do
    assert_difference('UploadData.count') do
      post :create, :upload_data => @upload_data.attributes
    end

    assert_redirected_to upload_data_path(assigns(:upload_data))
  end

  test "should show upload_data" do
    get :show, :id => @upload_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @upload_data.to_param
    assert_response :success
  end

  test "should update upload_data" do
    put :update, :id => @upload_data.to_param, :upload_data => @upload_data.attributes
    assert_redirected_to upload_data_path(assigns(:upload_data))
  end

  test "should destroy upload_data" do
    assert_difference('UploadData.count', -1) do
      delete :destroy, :id => @upload_data.to_param
    end

    assert_redirected_to upload_datas_path
  end
end
