require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repository = repositories(:one)
  end

  test 'should get index' do
    get repositories_url
    assert_response :success
  end

  test 'should show repository' do
    get repository_url(@repository.name)
    assert_response :success
  end
end
