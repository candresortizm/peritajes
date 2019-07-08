class V1::BenchmarksController < ApplicationController
  before_action :authenticate_user!, except: [:search,:init,:show]

  before_action :authenticate_car_expert!, only: [:new,:create,:edit,:update]
  # before_action :authenticate_brand_admin!, except: [:search,:init,:show]

  def index
    begin
      ActiveRecord::Base.transaction do
        if current_car_expert
          @all = current_user.car_inspections
        elsif current_brand_admin
          @all = CarInspection.where(car_expert_id:CarExpert.where(brand_id:current_user.brand_id).select(:id))
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end


  end

  def search
    begin
      ActiveRecord::Base.transaction do
        @all_results=CarInspection.where(car_id:Car.where(plate:params[:plate]).select(:id))
        if @all_results.empty?
          flash[:warning] = "No se han encontrado peritajes para la placa #{params[:plate]}"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  def init
  end

  def validation
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        params[:plate]=params[:plate].upcase
        car = Car.find_by(plate:params[:plate])
        @benchmark = CarInspection.new
        @benchmark.car = !car.nil? ? car : Car.new(plate:params[:plate])
        @car_types = CarType.all
        @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        benchmark_params["state"]="TAB_1"
        @benchmark = CarInspection.new(benchmark_params)
        if @benchmark.save
          redirect_to edit_benchmark_path(benchmark_id:@benchmark.id)
        end
      end
    rescue
      raise
    end
  end

  def edit
    begin
      ActiveRecord::Base.transaction do
        @benchmark = CarInspection.includes(:car).find(params["benchmark_id"])
        @car_types = CarType.all
        @answers = CarAnswer.where(car_inspection_id:params["benchmark_id"]).map{|answer| [answer.question_id,answer]}.to_h
        @photos = InspectionPhoto.where(car_inspection_id:params["benchmark_id"]).map{|photo| [photo.question_id,photo]}.to_h
        @comments = InspectionComment.where(car_inspection_id:params["benchmark_id"]).map{ |comment| [comment.question_category_id,comment]}.to_h
        @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
      end
    rescue
      raise
    end
  end

  def update
    begin
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
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
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
    rescue
      raise
    end
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
