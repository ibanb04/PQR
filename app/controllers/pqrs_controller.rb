class PqrsController < ApplicationController

    def index
    @pqrs = Pqr.new
    end
    def new
    @pqr = Pqr.new
    end

    def create
    
    end
end
