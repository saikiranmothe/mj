class FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.user_id = current_user.id
    @feedback.save
    redirect_to feedbacks_url, notice: 'Feedback was successfully created.'
  end

  def update
    @feedback = Feedback.find(params[:id])
    @feedback.update_attributes(params[:feedback])
    redirect_to feedbacks_url, notice: 'Feedback was successfully updated.'
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to feedbacks_url
  end
end
