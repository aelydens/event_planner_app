class EventsController < ApplicationController
  before_action :set_company

  def index
    @events = @company.events
  end

  def show
    @event = @company.events.find(params[:id])
    redirect_to company_path(@company)
  end

  def new
    @event = @company.events.new
  end

  def create
    @event = @company.events.new(event_params)
    if @event.save
      redirect_to company_events_path(@company)
    else
      render :new
    end
  end

  def destroy
    event = @company.events.find(params[:id])
    event.destroy
    redirect_to company_events_path(@company)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def event_params
    params.require(:event).permit(:name, :capacity)
  end

end
