class V1::ConcessionairesController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("SuperUser")
          @all = Concessionaire.all
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  def new
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("SuperUser")
          @concessionaire ||= Concessionaire.new
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("SuperUser")
          @concessionaire = Concessionaire.new(concessionaire_params)
          @concessionaire.save!
          redirect_to concessionaires_index_path
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue Exception => exc
      flash[:danger] = exc.message
      redirect_to new_concessionaire_path
    end
  end

  def admin_home
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("ConcessionaireAdmin")
          concessionaire_users = User.where(concessionaire_id:current_user.concessionaire_id,type:["CarExpert","Dispatcher"]).to_a
          @car_experts = concessionaire_users.select{|user| user.type=='CarExpert'}
          @dispatchers = concessionaire_users.select{|user| user.type=='Dispatcher'}
          @inspections = CarInspection.where(car_expert_id: @car_experts.map(&:id) )
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  def new_user
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("ConcessionaireAdmin")
          @user = User.new(type:params[:type])
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  def create_user
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("ConcessionaireAdmin")
          user = User.new(concessionaire_user_params).save!
          redirect_to concessionaire_admin_home_path
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue
      raise
    end
  end

  private

  def concessionaire_params
    params.require(:concessionaire).permit(
      :name,
      :address,
      :telephone,
      :nit,
      concessionaire_admins_attributes:[
        :email,
        :password,
        :password_confirmation
      ]
    )
  end

  def concessionaire_user_params
    user_type = "dispatcher".to_sym if !params[:dispatcher].nil?
    user_type = "car_expert".to_sym if !params[:car_expert].nil?
    params.require(user_type).permit(:type,:concessionaire_id,:email,:password,:password_confirmation)
  end
end
