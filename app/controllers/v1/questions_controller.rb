class V1::QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
        @all = Question.all
    end

    def create
        Question.new(question_params).save!
        redirect_to index_questions_path
    end

    def new
        @question = Question.new
        @categories = QuestionCategory.all
    end

    def update
        @all = Question.all
    end

    def edit
        @all = Question.all
    end

    def get_categories
        @categories=QuestionCategory.all
        # render json:{categories:@categories}
    end

    private

    def question_params
        params.require(:question).permit(:text_query,:question_type,:question_category_id)
    end
end
