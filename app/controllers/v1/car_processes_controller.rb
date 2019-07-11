class V1::CarProcessesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_dispatcher!, only: [:new,:create,:update,:edit]

  def index
    begin
      ActiveRecord::Base.transaction do
        @process_states = DOCUMENTATION_PROCCESS_STATES
        process_type = params[:process_type].nil? ? "buy" : params[:process_type]
        process_state = params[:process_state].nil? ? "open" : params[:process_state]
        if current_dispatcher
          @all = current_dispatcher.car_processes.includes(:car).where(process_type: process_type, state:process_state)
        elsif current_concessionaire_admin
          @all = CarProcess.includes(:car).where(process_type: process_type, state:process_state).where(dispatcher_id: Dispatcher.where(concessionaire_id:current_user.concessionaire_id).select(:id))
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
        @process_type = process_type
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
          exist_car_process = CarProcess.find_by(
                                      car_id: car.id,
                                      process_type: params[:process_type],
                                      dispatcher_id: current_user.id,
                                      state:"open"
                                    )
          if !exist_car_process.nil?
            redirect_to show_car_process_path(car_process_id: exist_car_process.id)
          end
        end
        @process_states = DOCUMENTATION_PROCCESS_STATES
        @car_process = CarProcess.new(process_type: params[:process_type])
        @car_process.car = !car.nil? ? car : Car.new(plate:params[:plate])
        @car_types = CarType.all
        @car_brands = CarBrand.all
        @doc_types = DocumentType.where(process_type:params[:process_type]).to_a
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        car_process = CarProcess.new(car_process_params)
        if car_process.save
          redirect_to car_processes_index_path
        end
      end
    rescue
      raise
    end
  end

  def show
    begin
      ActiveRecord::Base.transaction do
        @car_process = CarProcess.includes(:car).find(params[:car_process_id])
        @car_types = CarType.all
        @process_states = DOCUMENTATION_PROCCESS_STATES
        @car_brands = CarBrand.all
        @doc_types = DocumentType.where(process_type: @car_process.process_type)
        @documents = CarDocument.where(car_process_id:params[:car_process_id]).map{|document| [document.document_type_id,document]}.to_h
      end
    rescue
      raise
    end
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        CarProcess.find(car_process_params["id"]).update(car_process_params)
        redirect_to car_processes_index_path
      end
    rescue
      raise
    end
  end

  def edit
    @all = CarProcess.all
  end

  private

  def car_process_params
    params.require(:car_process).permit(
      :id,
      :dispatcher_id,
      :state,
      :process_type,
      :car_id,
      car_attributes:[
        :color,
        :car_brand_id,
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
