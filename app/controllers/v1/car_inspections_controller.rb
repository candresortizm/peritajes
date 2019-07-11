class V1::CarInspectionsController < ApplicationController
  before_action :authenticate_user!, except: [:search,:init,:show]

  before_action :authenticate_car_expert!, only: [:new,:create,:edit,:update]
  # before_action :authenticate_concessionaire_admin!, except: [:search,:init,:show]

  def index
    begin
      ActiveRecord::Base.transaction do
        if current_car_expert
          @all = current_user.car_inspections
        elsif current_concessionaire_admin
          @all = CarInspection.where(car_expert_id:CarExpert.where(concessionaire_id:current_user.concessionaire_id).select(:id))
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
        @car_inspection = CarInspection.new
        @car_inspection.car = !car.nil? ? car : Car.new(plate:params[:plate])
        @car_types = CarType.all
        @car_brands = CarBrand.all
        @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @car_inspection = CarInspection.new(car_inspection_params)
        @car_inspection.completed_tabs = [1]
        if @car_inspection.save
          redirect_to edit_car_inspection_path(car_inspection_id: @car_inspection.id)
        end
      end
    rescue
      raise
    end
  end

  def edit
    begin
      ActiveRecord::Base.transaction do
        @car_inspection = CarInspection.includes(:car).find(params["car_inspection_id"])
        @car_types = CarType.all
        @car_brands = CarBrand.all
        @answers = CarAnswer.where(car_inspection_id:params["car_inspection_id"]).map{|answer| [answer.question_id,answer]}.to_h
        @photos = InspectionPhoto.where(car_inspection_id:params["car_inspection_id"]).map{|photo| [photo.question_id,photo]}.to_h
        @comments = InspectionComment.where(car_inspection_id:params["car_inspection_id"]).map{ |comment| [comment.question_category_id,comment]}.to_h
        @questions = QuestionCategory.includes(:questions).order(order_category: :desc).to_a.map{ |category| [category,category.questions.order(order_question: :desc).to_a] }
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        @car_inspection = CarInspection.find(car_inspection_params["id"])
        car_inspection_params["completed_tabs"] = @car_inspection.completed_tabs << car_inspection_params["completed_tabs"]
        if car_inspection_params["completed_tabs"].size == 8
          car_inspection_params["state"] = "completed"
        end
        @car_inspection.update(car_inspection_params)
        if @car_inspection.state.eql?("completed")
          redirect_to car_inspections_index_path
        else
          redirect_to edit_car_inspection_path(car_inspection_id: @car_inspection.id)
        end
      end
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        @car_inspection = CarInspection.includes(:car).find(params[:car_inspection_id])
        @car_types = CarType.all
        @car_brands = CarBrand.all
        @inspection_photos = InspectionPhoto.where(car_inspection_id: params[:car_inspection_id]).group_by{|photo| photo.question_id}
        @comments = InspectionComment.where(car_inspection_id: params[:car_inspection_id]).map{|element| [element.question_category_id,element]}.to_h
        @questions = CarAnswer.includes(question: :question_category).where(
          car_inspection_id:params[:car_inspection_id]).group_by{ |variable|
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

  def car_inspection_params
    @car_inspection_params ||= params.require(:car_inspection).permit(
      :id,
      :car_expert_id,
      :owner,
      :kilometraje,
      :car_id,
      :photo_back,
      :photo_left,
      :photo_front,
      :photo_right,
      :photo_motor,
      :photo_inside,
      :completed_tabs,
      car_attributes:[
        :id,
        :color,
        :car_brand_id,
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
