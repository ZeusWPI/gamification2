require 'test_helper'

class CodersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coder = coders(:one)
  end

  test 'should get index' do
    get coders_url
    assert_response :success
  end

  test 'should show coder' do
    get coder_url(@coder.github_name)
    assert_response :success
  end
end
