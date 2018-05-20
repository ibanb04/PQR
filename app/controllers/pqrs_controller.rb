class PqrsController < ApplicationController

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
        @pqr = Pqr.find(params[:id])
    end

    def update
        @pqr = Pqr.find(params[:id])
        if @pqr.update(pqr_params)
            redirect_to pqrs_path
        else
            render :edit
        end
    end

    def destroy
        @pqr = Pqr.find(params[:id])
        @pqr.destroy
        redirect_to pqrs_path
    end

    private
        def pqr_params
        params.require(:pqr).permit(:user_id, :name_1, :name_2, :last_name_1, :last_name_2, :email, :number, :date, :descripcion, :state_id)
        end
end
