class EventsController < ApplicationController
  skip_before_filter :login_required

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.save
    redirect_to events_url, notice: 'Event was successfully created.'
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    redirect_to events_url, notice: 'Event was successfully updated.' 
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url 
  end
end
