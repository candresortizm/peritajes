class V1::BenchmarksController < ApplicationController
    before_action :authenticate_user!, except: [:search,:home]

    def index
        @all = CarInspection.all
    end

    def search
      @all_results=CarInspection.where(car_id:Car.where(plate:params[:plate]).select(:id))
    end

    def home
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
