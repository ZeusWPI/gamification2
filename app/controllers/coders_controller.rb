class CodersController < ApplicationController
  def show
    @coder = Coder.with_metrics.find_by(github_name: params[:id])
  end
end
