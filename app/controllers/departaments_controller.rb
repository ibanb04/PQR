class DepartamentsController < ApplicationController
    before_action :set_departament, only: [:edit, :update, :delete]
    def index
    @departaments = Departament.all
    end

    def new
        @departament = Departament.new
    end
    
    def create
        @departament = Departament.new(departament_params)
            if @departament.save
                redirect_to departaments_path
            else
                render :new
            end
    end

    def edit
    end

    def update
        if @departament.update(departament_params)
            redirect_to departaments_path
        else
            render :edit
        end
    end

    def delete
        @departament.destroy
        redirect_to departaments_path
    end

    private
        def departament_params
        params.require(:departament).permit(:name, :description)
        end

    def set_departament
        @departament = Departament.find(params[:id])
    end

end
