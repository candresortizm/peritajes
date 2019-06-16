class V1::BenchmarksController < ApplicationController
  before_action :authenticate_user!, except: [:search,:home,:show]

  def index
      @all = current_user.car_inspections
  end

  def search
    @all_results=CarInspection.where(car_id:Car.where(plate:params[:plate]).select(:id))
  end

  def home
  end

  def validation
  end

  def new
    ActiveRecord::Base.transaction do
      car = Car.find_by(plate:params[:plate])
      @benchmark = CarInspection.new
      @benchmark.car = !car.nil? ? car : Car.new(plate:params[:plate])
      @car_types = CarType.all
      @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
    end
  end

  def create
    ActiveRecord::Base.transaction do
      benchmark = CarInspection.new(benchmark_params)
      if benchmark.save
        redirect_to benchmarks_index_path
      else
        binding.pry
      end
    end
  end

  def show
    @benchmark = CarInspection.includes(:car).find(params[:benchmark_id])
    @car_types = CarType.all
    @comments = InspectionComment.where(car_inspection_id: params[:benchmark_id]).map{|element| [element.question_category_id,element]}.to_h
    @questions = CarAnswer.includes(question: :question_category).where(
                        car_inspection_id:params[:benchmark_id]).group_by{ |variable|
                          (variable.question.question_category)
                        }.map{ |category,answers|
                          [category,answers.map{|answer| [answer.question,answer]}]
                        }
  end

  private

  def benchmark_params
    params.require(:car_inspection).permit(
      :car_expert_id,
      :owner,
      :kilometraje,
      :color,
      :car_id,
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
