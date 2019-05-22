class V1::ProcessesController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = CarProcess.all
    end

    def new
    end

    def create
        @all = CarProcess.all
    end

    def update
        @all = CarProcess.all
    end

    def edit
        @all = CarProcess.all
    end
end
