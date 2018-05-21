class StatesController < ApplicationController
    before_action :set_state, only: [:edit, :update, :destroy]

    def index
    @states = State.all
    end
    
    def new
    @state = State.new
    end

    def create
    @state = State.new(state_params)
    if @state.save
        redirect_to states_path
    else
        render :new
    end
    end

    def edit
    end

    def update
        if @state.update state_params
            redirect_to states_path
        else
            render :edit
        end
    end

    def destroy
    @state.destroy
    redirect_to states_path
    end

    private
    def state_params
    params.require(:state).permit(:name, :description)
    end

    def set_state
        @state = State.find(params[:id])
    end

end
