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
    @benchmark = CarInspection.new
    @questions = QuestionCategory.includes(:questions).first(2).map{ |category| [category,category.questions.last(2)] }
  end

  def create
    binding.pry
  end

  def update
      @all = CarInspection.all
  end

  def edit
      @all = CarInspection.all
  end

  private

  def benchmark_params
    params.require(:car_inspection).permit(
      :owner,
      :kilometraje,
      :color,
      car_answers_attributes:[
        :id,
        :question_id,
        :answer
      ],
      inspection_comments_attributes:[
        :id,
        :question_category_id,
        :comment
      ]
    )
  end

end
