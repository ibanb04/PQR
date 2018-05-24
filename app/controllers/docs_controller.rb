class DocsController < ApplicationController

    before_action :set_doc, only: [:edit, :update, :destroy]
    
    def index
    @docs = Doc.all
    end

    def new
        @doc = Doc.new
    end
    
    def create
        @doc = Doc.new(doc_params)
            if @doc.save
                redirect_to docs_path
            else
                render :new
            end
    end

    def edit
    end

    def update
        if @doc.update(doc_params)
            redirect_to docs_path
        else
            render :edit
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private
        def doc_params
        params.require(:doc).permit(:pqr_id, :name)
        end

    def set_doc
        @doc = Doc.find(params[:id])
    end

end

