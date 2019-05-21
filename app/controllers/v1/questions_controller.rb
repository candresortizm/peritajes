class V1::QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = Question.all
    end
end
