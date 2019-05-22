class V1::QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = Question.all
    end

    def create
        @all = Question.all
    end

    def new
    end

    def update
        @all = Question.all
    end

    def edit
        @all = Question.all
    end

    def get_categories
        @categories=Category.all
        render json:{categories:@categories}
    end
end
