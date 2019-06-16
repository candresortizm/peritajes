class V1::QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all = Question.all
  end

  def create
    last = Question.where(question_category_id:question_params[:question_category_id]).order(order_question: :desc).first
    if last.order_question.to_i >= question_params[:order_question].to_i
      Question.where("questions.question_category_id = ? AND questions.order_question >= ?",
            question_params[:question_category_id],
            question_params[:order_question]).update_all("order_question = order_question + 1")
    elsif last.order_question != (question_params[:order_question].to_i - 1)
      question_params[:order_question]=last.order_question+1
    end
    Question.new(question_params).save!
    redirect_to index_questions_path
  end

  def new
    @question = Question.new
    @categories = QuestionCategory.all
    @question_types = QUERY_TYPES
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
    @question_params ||= params.require(:question).permit(:text_query,:question_type,:question_category_id,:points,:order_question,:key)
  end
end
