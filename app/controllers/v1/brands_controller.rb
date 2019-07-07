class V1::BrandsController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("SuperUser")
          @all = Brand.all
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
          @brand ||= Brand.new
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
          @brand = Brand.new(brand_params)
          @brand.save!
          redirect_to brands_index_path
        else
          flash[:warning] = "No está autorizado"
          redirect_to root_path
        end
      end
    rescue Exception => exc
      flash[:danger] = exc.message
      redirect_to new_brand_path
    end
  end

  def admin_home
    begin
      ActiveRecord::Base.transaction do
        if current_user.type.eql?("BrandAdmin")
          brand_users = User.where(brand_id:current_user.brand_id,type:["CarExpert","Dispatcher"]).to_a
          @car_experts = brand_users.select{|user| user.type=='CarExpert'}
          @dispatchers = brand_users.select{|user| user.type=='Dispatcher'}
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
        if current_user.type.eql?("BrandAdmin")
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
        if current_user.type.eql?("BrandAdmin")
          user = User.new(brand_user_params).save!
          redirect_to brand_admin_home_path
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

  def brand_params
    params.require(:brand).permit(
      :name,
      :address,
      :telephone,
      :nit,
      brand_admins_attributes:[
        :email,
        :password,
        :password_confirmation
      ]
    )
  end

  def brand_user_params
    user_type = "dispatcher".to_sym if !params[:dispatcher].nil?
    user_type = "car_expert".to_sym if !params[:car_expert].nil?
    params.require(user_type).permit(:type,:brand_id,:email,:password,:password_confirmation)
  end
end
