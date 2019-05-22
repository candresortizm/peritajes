class V1::BenchmarksController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = CarInspection.all
    end

    def new
    end

    def create
        @all = CarInspection.all
    end

    def update
        @all = CarInspection.all
    end

    def edit
        @all = CarInspection.all
    end
end
