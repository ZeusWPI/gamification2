require 'test_helper'

class CodersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coder = coders(:one)
  end

  test 'should get index' do
    get coders_url
    assert_response :success
  end

  test 'should get new' do
    get new_coder_url
    assert_response :success
  end

  test 'should create coder' do
    assert_difference('Coder.count') do
      post coders_url, params: { coder: { avatar_url: @coder.avatar_url, full_name: @coder.full_name, github_name: @coder.github_name, github_url: @coder.github_url } }
    end

    assert_redirected_to coder_url(Coder.last)
  end

  test 'should show coder' do
    get coder_url(@coder)
    assert_response :success
  end

  test 'should get edit' do
    get edit_coder_url(@coder)
    assert_response :success
  end

  test 'should update coder' do
    patch coder_url(@coder), params: { coder: { avatar_url: @coder.avatar_url, full_name: @coder.full_name, github_name: @coder.github_name, github_url: @coder.github_url } }
    assert_redirected_to coder_url(@coder)
  end

  test 'should destroy coder' do
    assert_difference('Coder.count', -1) do
      delete coder_url(@coder)
    end

    assert_redirected_to coders_url
  end
end
