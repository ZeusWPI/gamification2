class CodersController < ApplicationController
  def index
    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions repository_count].include?(@sort_column)
    @coders = Coder.extending(CommitStats).with_commit_stats.with_repository_count.order({ @sort_column => :desc })
  end

  def show
    @coder = Coder.extending(CommitStats)
                  .with_commit_stats
                  .with_repository_count
                  .find_by(github_name: params[:id])
  end
end
