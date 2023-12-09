class RepositoriesController < ApplicationController
  def index
    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions coder_count].include?(@sort_column)
    @repositories = Repository.extending(CommitStats).with_commit_stats.with_coder_count.order({ @sort_column => :desc })
  end

  def show
    @repository = Repository.find(params[:id])

    @sort_column = params[:order_by]
    @sort_column = 'score' unless %w[score commit_count additions deletions].include?(@sort_column)
    @coders = Coder.in_organisation
                   .extending(CommitStats)
                   .with_commit_stats
                   .where(commits: { repository_id: @repository.id })
                   .order({ @sort_column => :desc })
  end
end
