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
    @questions = QuestionCategory.includes(:questions).all.map{ |category| [category,category.questions] }
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
    params.require(:benchmark).permit(
      attributes: [
        :from,
        :until,
        :offer_id,
        :condition_id
      ]
    )
  end

end
