class CodersController < ApplicationController
  def show
    @coder = Coder.extending(CommitStats)
                  .with_commit_stats
                  .with_repository_count
                  .find_by(github_name: params[:id])
  end
end
