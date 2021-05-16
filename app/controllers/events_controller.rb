class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.where(user_id: current_user.id)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to events_path
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:user_id, :title, :content, :start_time, :end_time)
  end
end
