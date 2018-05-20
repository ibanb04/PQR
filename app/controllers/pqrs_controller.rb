class PqrsController < ApplicationController

    def index
    @pqrs = Pqr.new
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

    def delete
        @pqr = Pqr.find(params[:id])
        @pqr.destroy
        redirect_to pqrs_path
    end

    private
        def pqr_params
        params.require(:pqr).permit(:name, :description)
        end
end
