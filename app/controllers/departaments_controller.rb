class DepartamentsController < ApplicationController
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
        @departament = Departament.find(params[:id])
    end

    def update
        @departament = Departament.find(params[:id])
        if @departament.update(departament_params)
            redirect_to departaments_path
        else
            render :edit
        end
    end

    def delete
        @departament = Departament.find(params[:id])
        @departament.destroy
        redirect_to departaments_path
    end

    private
        def departament_params
        params.require(:departament).permit(:name, :description)
        end

end
