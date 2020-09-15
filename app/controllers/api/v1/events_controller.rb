class Api::V1::EventsController < ApplicationController
    before_action :find_event, only: [:show, :update, :destroy]

    def index
        @events = Event.where(user_id: params[:user_id])
        render json: @events
    end

    def show
        render json: @event
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            render json: @event
        else
            render error: { error: 'Event not created.' }, status: 400
        end
    end

    def update
        if @event
            @event.update(event_params)
            render json: { message: 'Event updated!' }, status: 200
        else
            render json: { error: 'Could not update event.' }, status: 400
        end
    end

    def destroy
        if @event
            @event.destroy
            render json: { message: 'Event deleted!' }, status: 400
        end
    end

    private

    def event_params
        params.require(:event).permit(:event, :event_type, :user_id)
    end

    def find_event
        @event = Event.where(user_id: params[:user_id], id: params[:id])
    end
end
