class TopicsController < ApplicationController
  before_action :require_admin, only: %i[ new create edit update ]

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @title = @topic.title
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
