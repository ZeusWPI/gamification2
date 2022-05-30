class RepositoriesController < ApplicationController
  def index
    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions coder_count].include?(@sort_column)
    @repositories = Repository.extending(CommitStats).with_commit_stats.with_coder_count.order({ @sort_column => :desc })
  end

  def show
    @repository = Repository.find(params[:id])
  end
end
