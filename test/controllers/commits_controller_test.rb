require 'test_helper'

class CommitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @commit = commits(:one)
  end

  test 'should get index' do
    get commits_url
    assert_response :success
  end

  test 'should get new' do
    get new_commit_url
    assert_response :success
  end

  test 'should create commit' do
    assert_difference('Commit.count') do
      post commits_url, params: { commit: { additions: @commit.additions, coder_id: @commit.coder_id, committed_at: @commit.committed_at, deletions: @commit.deletions, repository_id: @commit.repository_id, sha: @commit.sha } }
    end

    assert_redirected_to commit_url(Commit.last)
  end

  test 'should show commit' do
    get commit_url(@commit)
    assert_response :success
  end

  test 'should get edit' do
    get edit_commit_url(@commit)
    assert_response :success
  end

  test 'should update commit' do
    patch commit_url(@commit), params: { commit: { additions: @commit.additions, coder_id: @commit.coder_id, committed_at: @commit.committed_at, deletions: @commit.deletions, repository_id: @commit.repository_id, sha: @commit.sha } }
    assert_redirected_to commit_url(@commit)
  end

  test 'should destroy commit' do
    assert_difference('Commit.count', -1) do
      delete commit_url(@commit)
    end

    assert_redirected_to commits_url
  end
end
