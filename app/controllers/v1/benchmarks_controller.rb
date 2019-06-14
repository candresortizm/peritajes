class V1::BenchmarksController < ApplicationController
  before_action :authenticate_user!, except: [:search,:home,:show]

  def index
      @all = CarInspection.where(car_expert_id:current_user.id)
  end

  def search
    @all_results=CarInspection.where(car_id:Car.where(plate:params[:plate]).select(:id))
  end

  def home
  end

  def new
    ActiveRecord::Base.transaction do
      @benchmark = CarInspection.new
      @car_types = CarType.all
      @questions = QuestionCategory.includes(:questions).first(2).map{ |category| [category,category.questions.last(2)] }
    end
  end

  def create
    ActiveRecord::Base.transaction do
      benchmark = CarInspection.new(benchmark_params)
      if benchmark.save
        redirect_to benchmarks_index_path
      end
    end
  end

  def show
    @benchmark = CarInspection.includes(:car,:car_answers,:inspection_comments).find(params[:benchmark_id])
    @car_types = CarType.all
    @questions = QuestionCategory.includes(:questions).first(2).map{ |category| [category,category.questions.last(2)] }
  end

  private

  def benchmark_params
    params.require(:car_inspection).permit(
      :car_expert_id,
      :owner,
      :kilometraje,
      :color,
      car_attributes:[
        :car_brand,
        :model,
        :year,
        :vin,
        :plate,
        :car_type_id
      ],
      car_answers_attributes:[
        :question_id,
        :answer
      ],
      inspection_comments_attributes:[
        :question_category_id,
        :comment
      ]
    )
  end

end
