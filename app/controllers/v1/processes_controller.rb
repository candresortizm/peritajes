class V1::ProcessesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_dispatcher!, only: [:new,:create,:update,:edit]

  def index
    begin
      ActiveRecord::Base.transaction do
        @all = CarProcess.all
      end
    rescue
      raise
    end
  end

  def validation
    @documentation_types = DOCUMENTATION_TYPES
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        params[:plate]=params[:plate].upcase
        car = Car.find_by(plate:params[:plate])
        if !car.nil?
          exist_process = CarProcess.find_by(car_id: car.id,process_type: params[:process_type], dispatcher_id: current_user.id)
          if !exist_process.nil?
            redirect_to show_process_path(process_id:exist_process.id)
          end
        end
        @process = CarProcess.new(process_type: params[:process_type])
        @process.car = !car.nil? ? car : Car.new(plate:params[:plate])
        @car_types = CarType.all
        @doc_types = DocumentType.where(process_type:params[:process_type]).to_a
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        process = CarProcess.new(process_params)
        if process.save
          redirect_to processes_index_path
        end
      end
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        @process = CarProcess.includes(:car).find(params[:process_id])
        @car_types = CarType.all
        @doc_types = DocumentType.where(process_type: @process.process_type)
        @documents = CarDocument.where(car_process_id:params[:process_id]).map{|document| [document.document_type_id,document]}.to_h
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        CarProcess.update(process_params)
        redirect_to processes_index_path
      end
    rescue
      raise
    end
  end

  def edit
    @all = CarProcess.all
  end

  private

  def process_params
    params.require(:car_process).permit(
      :id,
      :dispatcher_id,
      :state,
      :process_type,
      :car_id,
      car_attributes:[
        :car_brand,
        :model,
        :year,
        :vin,
        :plate,
        :car_type_id
      ],
      car_documents_attributes:[
        :id,
        :document_type_id,
        :document,
        :state,
        :comment
      ]
    )
  end
end
