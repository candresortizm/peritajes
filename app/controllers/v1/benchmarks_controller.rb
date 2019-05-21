class V1::BenchmarksController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = CarInspection.all
    end
end
