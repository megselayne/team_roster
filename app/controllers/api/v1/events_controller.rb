class Api::V1::EventsController < ApplicationController
    before_action :find_event, only: [ :update, :destroy ]

    def index
        @events = Event.where(user_id: params[:user_id])
        render json: @events
    end

    def show
        @event = Event.where(user_id: params[:user_id], id: params[:id])
        render json: @event
    end

    def create
        # p params
        @event = Event.create(event: params["event"], event_type: params["event_type"], user_id: params["user_id"])
        if @event
            render json: @event
        else
            render error: { error: 'Event not created.' }, status: 400
        end
    end

    def update
        if @event
            @event.update(event: params["event"], event_type: params["event_type"])
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
        @event = Event.find(params[:id])
    end
end
