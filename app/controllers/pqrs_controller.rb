class PqrsController < ApplicationController
    before_action :set_pqr, only: [:edit, :update, :destroy]

    def index
    @pqrs = Pqr.all
    end

    def new
    @pqr = Pqr.new
    end

    def create
        @pqr = Pqr.new(pqr_params)
        if @pqr.save
            redirect_to pqrs_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @pqr.update(pqr_params)
            redirect_to pqrs_path
        else
            render :edit
        end
    end

    def destroy
        @pqr.destroy
        redirect_to pqrs_path
    end

    private
        def pqr_params
        params.require(:pqr).permit(:user_id, :name_1, :name_2, :last_name_1, :last_name_2, :email, :number, :date, :description, :state_id)
        end

    def set_pqr
        @pqr = Pqr.find(params[:id])
    end
end
