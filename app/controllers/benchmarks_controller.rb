class BenchmarksController < ApplicationController
    before_action :authenticate_user!

    def temp_benchmark
        @all = ["hola","nuevo","mundo"]
    end
end
