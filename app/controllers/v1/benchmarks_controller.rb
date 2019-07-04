class V1::BenchmarksController < ApplicationController
  before_action :authenticate_user!, except: [:search,:init,:show]

  def index
    if current_user.type.eql?("CarExpert")
      @all = current_user.car_inspections
    elsif current_user.type.eql?("BrandAdmin")
      @all = CarInspection.where(car_expert_id:CarExpert.where(brand_id:current_user.brand_id).select(:id))
    end
  end

  def search
    @all_results=CarInspection.where(car_id:Car.where(plate:params[:plate]).select(:id))
    if @all_results.empty?
      flash[:warning] = "No se han encontrado peritajes para la placa #{params[:plate]}"
      redirect_to root_path
    end
  end

  def init
  end

  def validation
  end

  def new
    ActiveRecord::Base.transaction do
      params[:plate]=params[:plate].upcase
      car = Car.find_by(plate:params[:plate])
      @benchmark = CarInspection.new
      @benchmark.car = !car.nil? ? car : Car.new(plate:params[:plate])
      @car_types = CarType.all
      @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
    end
  end

  def create
    ActiveRecord::Base.transaction do
      @benchmark = CarInspection.new(benchmark_params)
      if @benchmark.save
        redirect_to edit_benchmark_path(benchmark_id:@benchmark.id)
      end
    end
  end

  def edit
    ActiveRecord::Base.transaction do
      @benchmark = CarInspection.includes(:car).find(params["benchmark_id"])
      @car_types = CarType.all
      @answers = CarAnswer.where(car_inspection_id:params["benchmark_id"]).map{|answer| [answer.question_id,answer]}.to_h
      @photos = InspectionPhoto.where(car_inspection_id:params["benchmark_id"]).map{|photo| [photo.question_id,photo]}.to_h
      @comments = InspectionComment.where(car_inspection_id:params["benchmark_id"]).map{ |comment| [comment.question_category_id,comment]}.to_h
      @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
    end
  end

  def update
    ActiveRecord::Base.transaction do
      @benchmark = CarInspection.find(benchmark_params["id"])
      benchmark_params["state"] = @benchmark.next_step
      @benchmark.update(benchmark_params)
      if @benchmark.state.eql?("COMPLETED")
        redirect_to benchmarks_index_path
      else
        redirect_to edit_benchmark_path(benchmark_id: @benchmark.id)
      end
    end
  end

  def show
    @benchmark = CarInspection.includes(:car).find(params[:benchmark_id])
    @car_types = CarType.all
    @inspection_photos = InspectionPhoto.where(car_inspection_id: params[:benchmark_id]).group_by{|photo| photo.question_id}
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
    @benchmark_params ||= params.require(:car_inspection).permit(
      :id,
      :car_expert_id,
      :owner,
      :kilometraje,
      :color,
      :car_id,
      :photo_back,
      :photo_left,
      :photo_front,
      :photo_right,
      :photo_motor,
      :photo_inside,
      car_attributes:[
        :id,
        :car_brand,
        :model,
        :year,
        :vin,
        :plate,
        :car_type_id
      ],
      car_answers_attributes:[
        :id,
        :question_id,
        :answer
      ],
      inspection_comments_attributes:[
        :id,
        :question_category_id,
        :comment
      ],
      inspection_photos_attributes:[
        :id,
        :question_id,
        :image
      ]
    )
  end

end
