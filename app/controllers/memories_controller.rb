class MemoriesController < ApplicationController
  def index
  end

  def import
    render partial: "result", locals: {tweets: TweetAnalyzer.analyze(params[:csv]) }
  end
end
