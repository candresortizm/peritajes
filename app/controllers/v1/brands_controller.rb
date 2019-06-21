class V1::BrandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    Brand.new(brand_params).save!
    redirect_to brands_index_path
  end

  def admin_home
    brand_users = User.where(brand_id:current_user.brand_id,type:["CarExpert","Dispatcher"]).to_a
    @car_experts = brand_users.select{|user| user.type=='CarExpert'}
    @dispatchers = brand_users.select{|user| user.type=='Dispatcher'}
    @inspections = CarInspection.where(car_expert_id: @car_experts.map(&:id) )
  end

  def new_user
    @user = User.new(type:params[:type])
  end

  def create_user
    user = User.new(brand_user_params).save!
    redirect_to brand_admin_home_path
  end

  def update
    @all = CarInspection.all
  end

  def edit
    @all = CarInspection.all
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
