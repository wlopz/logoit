require 'test_helper'

class CompanyInfosControllerTest < ActionController::TestCase
  setup do
    @company_info = company_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_info" do
    assert_difference('CompanyInfo.count') do
      post :create, company_info: { address: @company_info.address, company_name: @company_info.company_name, user_id: @company_info.user_id, website: @company_info.website }
    end

    assert_redirected_to company_info_path(assigns(:company_info))
  end

  test "should show company_info" do
    get :show, id: @company_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_info
    assert_response :success
  end

  test "should update company_info" do
    patch :update, id: @company_info, company_info: { address: @company_info.address, company_name: @company_info.company_name, user_id: @company_info.user_id, website: @company_info.website }
    assert_redirected_to company_info_path(assigns(:company_info))
  end

  test "should destroy company_info" do
    assert_difference('CompanyInfo.count', -1) do
      delete :destroy, id: @company_info
    end

    assert_redirected_to company_infos_path
  end
end
