class V1::ProcessesController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = Process.all
    end
end
