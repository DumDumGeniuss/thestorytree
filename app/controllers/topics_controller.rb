class TopicsController < ApplicationController
  before_action :authenticate_user! ,:except =>[:get_newest]
  layout "navbar"
  
  def get_newest
    @topics = Topic.order(created_at: :desc).limit(10)
    render json: @topics
  end

  def new
    render json: {user_id:current_user.id}
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      @info = {status:"success"}
      render json: @info
    else
      @info = {status:"fail"}
      render json: @info
    end
    #redirect_to story_home_static_pages_path
  end

  def topic_params
    params.require(:topic).permit(:title ,:length_limit_min ,:length_limit_max ,:articles_limit ,:private ,:score_limit , :browse_times , :time_out , :comment_amount ,
    :articles_attributes => [:user_id,:first_article,:likes,:report_times,:comment_amount,:content] )
  end
end